import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/job_icon_mapper.dart';
import '../../../../core/utils/salary_formatter.dart';
import '../../state/profile_notifier.dart';

class AppliedJobsPage extends ConsumerWidget {
  const AppliedJobsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appliedJobsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('appliedJobs'.tr())),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text('error'.tr())),
        data: (jobs) {
          if (jobs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.inbox_outlined,
                      size: 64, color: AppColors.grey300),
                  const SizedBox(height: 16),
                  Text('noAppliedJobs'.tr(),
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: jobs.length,
            itemBuilder: (ctx, i) {
              final j = jobs[i].job;
              if (j == null) return const SizedBox.shrink();
              return Card(
                child: ListTile(
                  leading: ClipRRect(
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
                  title: Text(j.name ?? '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  subtitle: Text(
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
                  trailing: const Icon(Icons.chevron_right,
                      color: AppColors.grey300),
                  onTap: () => context.push('/jobs/${j.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
