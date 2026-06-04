import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../data/datasources/favorite_remote_source.dart';
import '../../../data/models/job/paging_job_response.dart';
import '../../auth/state/auth_notifier.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier,
    AsyncValue<List<PagingJobResponse>>>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return FavoritesNotifier(
    ref.read(favoriteRemoteSourceProvider),
    isLoggedIn: authState.isLoggedIn,
  );
});

class FavoritesNotifier
    extends StateNotifier<AsyncValue<List<PagingJobResponse>>> {
  final FavoriteRemoteSource _remoteSource;
  final bool isLoggedIn;

  int _currentPage = 0;
  int _totalPages = 1;

  FavoritesNotifier(this._remoteSource, {required this.isLoggedIn})
      : super(isLoggedIn ? const AsyncValue.loading() : const AsyncValue.data([])) {
    if (isLoggedIn) {
      loadFavorites();
    }
  }

  Future<void> loadFavorites() async {
    _currentPage = 0;
    state = const AsyncValue.loading();
    await _fetchPage();
  }

  Future<void> _fetchPage() async {
    try {
      final response = await _remoteSource.getFavorites(
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

  Future<void> refresh() async {
    await loadFavorites();
  }

  Future<void> addFavorite(int jobId) async {
    try {
      await _remoteSource.addFavorite(jobId);
    } catch (_) {}
  }

  Future<void> removeFavorite(int jobId) async {
    final currentList = state.value ?? [];
    final updatedList =
        currentList.where((j) => j.job?.id != jobId).toList();
    state = AsyncValue.data(updatedList);
    try {
      await _remoteSource.removeFavorite(jobId);
    } catch (e) {
      state = AsyncValue.data(currentList);
    }
  }
}
