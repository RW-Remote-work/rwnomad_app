import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/job_icon_mapper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/salary_formatter.dart';
import '../../../../data/models/job/paging_job_response.dart';
import '../../../../data/models/reference/job_class.dart';
import '../../../../data/models/reference/country.dart';
import '../../../../data/datasources/reference_remote_source.dart';
import '../../state/job_list_notifier.dart';
import '../../state/job_filter_notifier.dart';
import '../../../favorites/state/favorites_notifier.dart';
import '../../../auth/state/auth_notifier.dart';

final jobClassesProvider = FutureProvider<List<JobClass>>((ref) async {
  return ref.read(referenceRemoteSourceProvider).getJobClasses();
});

final countriesProvider = FutureProvider<List<Country>>((ref) async {
  return ref.read(referenceRemoteSourceProvider).getCountries();
});

class JobListPage extends ConsumerStatefulWidget {
  const JobListPage({super.key});

  @override
  ConsumerState<JobListPage> createState() => _JobListPageState();
}

class _JobListPageState extends ConsumerState<JobListPage> with WidgetsBindingObserver {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final jobState = ref.read(jobListProvider);
      if (jobState.hasError) {
        ref.read(jobListProvider.notifier).refresh();
      }
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final notifier = ref.read(jobListProvider.notifier);
      if (notifier.hasMore) {
        notifier.loadMore();
      }
    }
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => const _FilterSheet(),
    );
  }

  Future<void> _toggleFavorite(PagingJobResponse job) async {
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
    final jobId = job.job?.id;
    if (jobId == null) return;

    final favNotifier = ref.read(favoritesProvider.notifier);
    final isFav = job.isFavorite ?? false;

    if (isFav) {
      await favNotifier.removeFavorite(jobId);
    } else {
      await favNotifier.addFavorite(jobId);
    }
    ref.read(jobListProvider.notifier).updateJobFavoriteStatus(jobId, !isFav);
    ref.invalidate(favoritesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final jobState = ref.watch(jobListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('discoverJobs'.tr()),
        actions: [
          IconButton(
            icon: Badge(
              isLabelVisible: ref.read(jobFilterNotifierProvider.notifier).hasActiveFilters,
              child: const Icon(Icons.tune),
            ),
            onPressed: () => _showFilterSheet(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(jobListProvider.notifier).refresh(),
        child: jobState.when(
          loading: () => const _JobListSkeleton(),
          error: (error, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: AppColors.grey300),
                const SizedBox(height: 12),
                Text('error'.tr(), style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => ref.read(jobListProvider.notifier).refresh(),
                  child: Text('retry'.tr()),
                ),
              ],
            ),
          ),
          data: (jobs) {
            if (jobs.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.work_off, size: 64, color: AppColors.grey300),
                    const SizedBox(height: 16),
                    Text('noJobs'.tr(), style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              );
            }
            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: jobs.length + 1,
              itemBuilder: (ctx, i) {
                if (i == jobs.length) {
                  final hasMore = ref.read(jobListProvider.notifier).hasMore;
                  return hasMore
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox(height: 80);
                }
                return _JobCard(
                  job: jobs[i],
                  onTap: () => context.push('/jobs/${jobs[i].job?.id}'),
                  onFavorite: () => _toggleFavorite(jobs[i]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  final PagingJobResponse job;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const _JobCard({
    required this.job,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final j = job.job;
    if (j == null) return const SizedBox.shrink();

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 48,
                      height: 48,
                      color: iconBgColor(j.jobClassId, j.jobClassName),
                      child: Center(
                        child: Icon(
                          classIcon(j.jobClassId, j.jobClassName),
                          color: iconFgColor(j.jobClassId, j.jobClassName),
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          j.name ?? '',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          j.publisherName ?? j.companyInfo ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      job.isFavorite == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: job.isFavorite == true
                          ? AppColors.favorite
                          : AppColors.grey300,
                      size: 22,
                    ),
                    onPressed: onFavorite,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _Tag(
                    label: j.jobClassName ?? '',
                    color: AppColors.purple500,
                  ),
                  const SizedBox(width: 8),
                  _Tag(
                    label: j.type ?? '',
                    color: AppColors.green500,
                  ),
                  if (j.countryName != null) ...[
                    const SizedBox(width: 8),
                    _Tag(
                      label: j.countryName!,
                      color: AppColors.orange500,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  if (job.matchScore != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.purple50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${job.matchScore!.toInt()}%',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blue100,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;

  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    if (label.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: color.withOpacity(0.8),
        ),
      ),
    );
  }
}

// Filter bottom sheet
class _FilterSheet extends ConsumerStatefulWidget {
  const _FilterSheet();

  @override
  ConsumerState<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends ConsumerState<_FilterSheet> {
  final _keywordController = TextEditingController();
  late List<int> _selectedClasses;
  late String? _selectedType;
  int? _selectedCountryId;
  String _sortBy = 'publish_time,desc';

  static const _jobTypes = [
    {'label': 'REMOTE_FULL_TIME', 'text': 'remoteFullTime'},
    {'label': 'REMOTE_PART_TIME', 'text': 'remotePartTime'},
    {'label': 'REMOTE_INTERN', 'text': 'remoteIntern'},
    {'label': 'PROJECT_COOP', 'text': 'projectCoop'},
  ];

  @override
  void initState() {
    super.initState();
    final filter = ref.read(jobFilterNotifierProvider);
    _selectedClasses = List.from(filter.jobClassIdList ?? []);
    _selectedType = filter.typeList?.isNotEmpty == true
        ? filter.typeList!.first
        : null;
    _selectedCountryId = filter.countryId;
    _keywordController.text = filter.name ?? '';
    _sortBy = filter.sortBy ?? 'publish_time,desc';
  }

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  void _apply() {
    final notifier = ref.read(jobFilterNotifierProvider.notifier);
    notifier.setKeyword(_keywordController.text);
    notifier.setJobTypes(_selectedType != null ? [_selectedType!] : []);
    notifier.setCountry(_selectedCountryId);
    notifier.setSortBy(_sortBy);
    if (_selectedClasses.isNotEmpty) {
      for (final id in _selectedClasses) {
        if (!(ref.read(jobFilterNotifierProvider).jobClassIdList ?? []).contains(id)) {
          notifier.toggleJobClass(id);
        }
      }
    } else {
      notifier.reset();
      notifier.setKeyword(_keywordController.text);
      notifier.setJobTypes(_selectedType != null ? [_selectedType!] : []);
      notifier.setCountry(_selectedCountryId);
      notifier.setSortBy(_sortBy);
    }
    ref.read(jobListProvider.notifier).refresh();
    Navigator.pop(context);
  }

  void _reset() {
    setState(() {
      _selectedClasses.clear();
      _selectedType = null;
      _selectedCountryId = null;
      _sortBy = 'publish_time,desc';
      _keywordController.clear();
    });
    ref.read(jobFilterNotifierProvider.notifier).reset();
    ref.read(jobListProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final classesAsync = ref.watch(jobClassesProvider);
    final countriesAsync = ref.watch(countriesProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('filter'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600)),
                TextButton(onPressed: _reset, child: Text('reset'.tr())),
              ],
            ),
            // Keyword
            Text('keyword'.tr(),
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            TextField(
              controller: _keywordController,
              decoration: InputDecoration(
                hintText: 'pleaseEnterKeyword'.tr(),
                suffixIcon: const Icon(Icons.search, size: 20),
              ),
            ),
            const SizedBox(height: 20),
            // Job classification
            Text('jobClassification'.tr(),
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            classesAsync.when(
              data: (classes) => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: classes.map((c) {
                  final selected = _selectedClasses.contains(c.id);
                  return FilterChip(
                    label: Text(c.name ?? ''),
                    selected: selected,
                    onSelected: (v) {
                      setState(() {
                        if (v) {
                          _selectedClasses.add(c.id!);
                        } else {
                          _selectedClasses.remove(c.id);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              loading: () => const SizedBox(height: 40,
                  child: Center(child: CircularProgressIndicator())),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 20),
            // Job type
            Text('jobType'.tr(),
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _jobTypes.map((t) {
                final selected = _selectedType == t['label'];
                return ChoiceChip(
                  label: Text(t['text']!.toString().tr()),
                  selected: selected,
                  onSelected: (v) {
                    setState(() => _selectedType = v ? t['label'] as String : null);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Country — searchable selector
            Text('location'.tr(),
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            countriesAsync.when(
              data: (countries) {
                final selected = _selectedCountryId;
                final label = selected != null
                    ? countries.where((c) => c.id == selected).firstOrNull?.name
                    : null;
                return _SearchableDropdown<Country>(
                  displayText: label ?? 'all'.tr(),
                  items: countries,
                  itemLabel: (c) => c.name ?? '',
                  onChanged: (c) => setState(() => _selectedCountryId = c?.id),
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _apply,
              child: Text('applyFilter'.tr()),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _JobListSkeleton extends StatelessWidget {
  const _JobListSkeleton();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey100,
      highlightColor: AppColors.grey50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: 6,
        itemBuilder: (_, __) => Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(width: 48, height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        )),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 14, color: Colors.white),
                          const SizedBox(height: 8),
                          Container(width: 100, height: 10, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(width: 200, height: 12, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A tappable dropdown that opens a search dialog for filtering.
class _SearchableDropdown<T> extends StatelessWidget {
  final String displayText;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?) onChanged;

  const _SearchableDropdown({
    required this.displayText,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showSearch(context),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(child: Text(displayText)),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }

  void _showSearch(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _SearchDialog<T>(
        items: items,
        itemLabel: itemLabel,
        onSelected: (selected) {
          onChanged(selected);
          Navigator.pop(ctx);
        },
      ),
    );
  }
}

class _SearchDialog<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T) onSelected;

  const _SearchDialog({
    required this.items,
    required this.itemLabel,
    required this.onSelected,
  });

  @override
  State<_SearchDialog<T>> createState() => _SearchDialogState<T>();
}

class _SearchDialogState<T> extends State<_SearchDialog<T>> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<T> get _filtered {
    if (_query.isEmpty) return widget.items;
    return widget.items
        .where((item) =>
            widget.itemLabel(item).toLowerCase().contains(_query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filtered.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text(widget.itemLabel(_filtered[i])),
                  onTap: () => widget.onSelected(_filtered[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
