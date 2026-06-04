import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../data/datasources/favorite_remote_source.dart';
import '../../../data/models/job/paging_job_response.dart';

final appliedJobsProvider = StateNotifierProvider<AppliedJobsNotifier,
    AsyncValue<List<PagingJobResponse>>>((ref) {
  return AppliedJobsNotifier(ref.read(favoriteRemoteSourceProvider));
});

class AppliedJobsNotifier
    extends StateNotifier<AsyncValue<List<PagingJobResponse>>> {
  final FavoriteRemoteSource _remoteSource;

  int _currentPage = 0;
  int _totalPages = 1;

  AppliedJobsNotifier(this._remoteSource) : super(const AsyncValue.loading()) {
    loadAppliedJobs();
  }

  Future<void> loadAppliedJobs() async {
    _currentPage = 0;
    state = const AsyncValue.loading();
    await _fetchPage();
  }

  Future<void> _fetchPage() async {
    try {
      final response = await _remoteSource.getAppliedJobs(
        page: _currentPage,
        size: AppConfig.pageSize,
      );
      _totalPages = response.pages ?? 1;
      List<PagingJobResponse> currentList =
          state.value != null ? List.from(state.value!) : [];
      currentList.addAll(response.records ?? []);
      state = AsyncValue.data(currentList);
    } catch (e, st) {
      if (state.value == null || state.value!.isEmpty) {
        state = AsyncValue.error(e, st);
      }
    }
  }

  Future<void> loadMore() async {
    if (_currentPage + 1 >= _totalPages) return;
    _currentPage++;
    await _fetchPage();
  }

  bool get hasMore => _currentPage + 1 < _totalPages;
}
