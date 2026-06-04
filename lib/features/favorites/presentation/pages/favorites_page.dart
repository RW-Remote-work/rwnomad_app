import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/job_icon_mapper.dart';
import '../../../../core/utils/salary_formatter.dart';
import '../../../../data/models/job/paging_job_response.dart';
import '../../state/favorites_notifier.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('favorites'.tr())),
      body: RefreshIndicator(
        onRefresh: () => ref.read(favoritesProvider.notifier).refresh(),
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(child: Text('error'.tr())),
          data: (jobs) {
            if (jobs.isEmpty) {
              return ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.favorite_border,
                              size: 64, color: AppColors.grey300),
                          const SizedBox(height: 16),
                          Text('noFavorites'.tr(),
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: jobs.length,
              itemBuilder: (ctx, i) => _FavoriteJobCard(
                job: jobs[i],
                onTap: () => context.push('/jobs/${jobs[i].job?.id}'),
                onRemove: () {
                  final id = jobs[i].job?.id;
                  if (id != null) {
                    ref.read(favoritesProvider.notifier).removeFavorite(id);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FavoriteJobCard extends StatelessWidget {
  final PagingJobResponse job;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _FavoriteJobCard({
    required this.job,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final j = job.job;
    if (j == null) return const SizedBox.shrink();

    return Dismissible(
      key: Key('fav-${j.id}'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        color: Colors.red.shade50,
        child: const Icon(Icons.delete_outline, color: Colors.red),
      ),
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 44,
                    height: 44,
                    color: iconBgColor(j.jobClassId, j.jobClassName),
                    child: Center(
                      child: Icon(
                        classIcon(j.jobClassId, j.jobClassName),
                        color: iconFgColor(j.jobClassId, j.jobClassName),
                        size: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(j.name ?? '',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text(
                        SalaryFormatter.format(
                          minSalary: j.salaryMin,
                          maxSalary: j.salaryMax,
                          salaryType: j.salaryType,
                          currencyCode: j.currencyCode,
                          negotiableText: 'salaryNegotiable'.tr(),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.blue100,
                            ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: AppColors.grey300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
