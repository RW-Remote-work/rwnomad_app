import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../data/datasources/job_remote_source.dart';
import '../../../data/models/job/paging_job_response.dart';
import 'job_filter_notifier.dart';

final jobListProvider =
    StateNotifierProvider<JobListNotifier, AsyncValue<List<PagingJobResponse>>>(
        (ref) {
  return JobListNotifier(
    ref.read(jobRemoteSourceProvider),
    ref,
  );
});

class JobListNotifier
    extends StateNotifier<AsyncValue<List<PagingJobResponse>>> {
  final JobRemoteSource _remoteSource;
  final Ref _ref;

  int _currentPage = 0;
  int _totalPages = 1;
  final List<PagingJobResponse> _allJobs = [];

  JobListNotifier(this._remoteSource, this._ref)
      : super(const AsyncValue.loading()) {
    loadJobs();
  }

  Future<void> loadJobs() async {
    _currentPage = 0;
    _allJobs.clear();
    state = const AsyncValue.loading();
    await _fetchPage();
  }

  Future<void> _fetchPage() async {
    try {
      final filter = _ref.read(jobFilterNotifierProvider);
      final response = await _remoteSource.pagingJob(
        page: _currentPage,
        size: AppConfig.pageSize,
        filter: filter,
      );
      _totalPages = response.pages ?? 1;
      _allJobs.addAll(response.records ?? []);
      state = AsyncValue.data(List.from(_allJobs));
    } catch (e, st) {
      if (_allJobs.isEmpty) {
        state = AsyncValue.error(e, st);
      }
    }
  }

  Future<void> loadMore() async {
    if (_currentPage + 1 >= _totalPages) return;
    _currentPage++;
    await _fetchPage();
  }

  Future<void> refresh() async {
    _currentPage = 0;
    _allJobs.clear();
    state = const AsyncValue.loading();
    await _fetchPage();
  }

  bool get hasMore => _currentPage + 1 < _totalPages;

  void updateJobFavoriteStatus(int jobId, bool isFavorite) {
    _allJobs.asMap().forEach((index, job) {
      if (job.job?.id == jobId) {
        _allJobs[index] = job.copyWith(isFavorite: isFavorite);
      }
    });
    state = AsyncValue.data(List.from(_allJobs));
  }
}
