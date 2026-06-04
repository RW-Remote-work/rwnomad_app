import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/salary_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../data/models/job/paging_job_response.dart';
import '../../../../data/datasources/job_remote_source.dart';
import '../../state/job_detail_notifier.dart';
import '../../../favorites/state/favorites_notifier.dart';
import '../../../auth/state/auth_notifier.dart';

class JobDetailPage extends ConsumerStatefulWidget {
  final int jobId;
  const JobDetailPage({super.key, required this.jobId});

  @override
  ConsumerState<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends ConsumerState<JobDetailPage> {
  bool? _isFavorite;

  Future<void> _toggleFavorite() async {
    final authState = ref.read(authNotifierProvider);
    if (!authState.isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('login'.tr()),
          action: SnackBarAction(
            label: 'Go',
            onPressed: () => context.push('/login'),
          ),
        ),
      );
      return;
    }
    final fav = _isFavorite ?? false;
    final favNotifier = ref.read(favoritesProvider.notifier);
    if (fav) {
      await favNotifier.removeFavorite(widget.jobId);
    } else {
      await favNotifier.addFavorite(widget.jobId);
    }
    ref.invalidate(favoritesProvider);
    if (mounted) setState(() => _isFavorite = !fav);
  }

  Future<void> _applyJob() async {
    final authState = ref.read(authNotifierProvider);
    if (!authState.isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('login'.tr()),
          action: SnackBarAction(
            label: 'Go',
            onPressed: () => context.push('/login'),
          ),
        ),
      );
      return;
    }
    try {
      final source = ref.read(jobRemoteSourceProvider);
      await source.applyJob(widget.jobId);
      if (!mounted) return;
      Fluttertoast.showToast(msg: 'applySuccess'.tr());
      _showDeliveryInfo();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('error'.tr())),
      );
    }
  }

  Future<void> _showDeliveryInfo() async {
    try {
      final source = ref.read(jobRemoteSourceProvider);
      final deliver = await source.getJobDeliver(widget.jobId);
      if (!mounted) return;

      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (ctx) => _DeliverySheet(deliver: deliver),
      );
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(jobDetailProvider(widget.jobId));

    // Sync favorite state from API response on first load.
    ref.listen(jobDetailProvider(widget.jobId), (prev, next) {
      next.whenData((data) {
        final jobResp = data['job'] as PagingJobResponse;
        if (_isFavorite == null) {
          setState(() => _isFavorite = jobResp.isFavorite ?? false);
        }
      });
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('jobDetail'.tr()),
        actions: [
          IconButton(
            icon: Icon(
              (_isFavorite ?? false) ? Icons.favorite : Icons.favorite_border,
              color: (_isFavorite ?? false) ? AppColors.favorite : null,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('error'.tr())),
        data: (data) {
          final job = (data['job'] as PagingJobResponse);
          final j = job.job;
          if (j == null) {
            return Center(child: Text('noJobs'.tr()));
          }

          final isBlurred = job.blurEffect == true;

          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(j.name ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            )),
                    const SizedBox(height: 12),
                    // Salary
                    Text(
                      SalaryFormatter.format(
                        minSalary: j.salaryMin,
                        maxSalary: j.salaryMax,
                        salaryType: j.salaryType,
                        currencyCode: j.currencyCode,
                        negotiableText: 'salaryNegotiable'.tr(),
                      ),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.blue100,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 16),
                    // Tags
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (j.jobClassName != null)
                          _Tag(label: j.jobClassName!, color: AppColors.purple500),
                        if (j.type != null)
                          _Tag(label: j.type!, color: AppColors.green500),
                        if (j.countryName != null)
                          _Tag(label: j.countryName!, color: AppColors.orange500),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (j.publishTime != null)
                      Text(
                        '${'publishTime'.tr()}: ${DateFormatter.format(j.publishTime)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    const SizedBox(height: 20),
                    // Company
                    if (j.companyInfo != null && j.companyInfo!.isNotEmpty) ...[
                      _Section(title: 'companyInfo'.tr(), content: j.companyInfo!),
                    ],
                    // Duty
                    if (j.duty != null && j.duty!.isNotEmpty)
                      _Section(title: 'duty'.tr(), content: j.duty!),
                    // Requirement
                    if (j.requirement != null && j.requirement!.isNotEmpty)
                      _Section(title: 'requirement'.tr(), content: j.requirement!),
                    // Labels
                    if (job.labels != null && job.labels!.isNotEmpty)
                      _Section(
                        title: 'labels'.tr(),
                        content: job.labels!.map((l) => l.name ?? '').join(', '),
                      ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              // Blur overlay
              if (isBlurred)
                Positioned.fill(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        color: Colors.white.withOpacity(0.3),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.lock_outline,
                                    size: 48, color: AppColors.grey400),
                                const SizedBox(height: 16),
                                Text('memberLocked'.tr(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: AppColors.textPrimary)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              // Bottom bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: ElevatedButton(
                      onPressed: isBlurred ? null : _applyJob,
                      child: Text('apply'.tr()),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String content;
  const _Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                )),
        const SizedBox(height: 8),
        Html(
          data: content,
          style: {
            'body': Style(
              margin: Margins.zero,
              padding: HtmlPaddings.zero,
              fontSize: FontSize(14),
              color: AppColors.textPrimary,
              lineHeight: const LineHeight(1.6),
            ),
            'p': Style(
              margin: Margins.only(bottom: 8),
              padding: HtmlPaddings.zero,
            ),
            'ul': Style(
              margin: Margins.only(top: 4, bottom: 8),
              padding: HtmlPaddings.only(left: 16),
            ),
            'li': Style(
              margin: Margins.only(bottom: 4),
            ),
          },
        ),
        const Divider(height: 24),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color.withOpacity(0.8),
          )),
    );
  }
}

class _DeliverySheet extends StatelessWidget {
  final Map<String, dynamic> deliver;
  const _DeliverySheet({required this.deliver});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('deliveryInfo'.tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
          const SizedBox(height: 20),
          _InfoRow(
            icon: Icons.email_outlined,
            label: 'deliverEmail',
            value: deliver['deliverEmail']?.toString(),
          ),
          _InfoRow(
            icon: Icons.chat_outlined,
            label: 'deliverWechat',
            value: deliver['deliverWechat']?.toString(),
          ),
          _InfoRow(
            icon: Icons.telegram,
            label: 'deliverTelegram',
            value: deliver['deliverTelegram']?.toString(),
          ),
          _InfoRow(
            icon: Icons.language,
            label: 'deliverWebsite',
            value: deliver['deliverWebsite']?.toString(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.grey400),
          const SizedBox(width: 12),
          Text('${label.tr()}: ',
              style: Theme.of(context).textTheme.bodySmall),
          Expanded(
            child: Text(value!,
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          IconButton(
            icon: const Icon(Icons.copy, size: 18),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: value!));
              Fluttertoast.showToast(msg: 'copied'.tr());
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
