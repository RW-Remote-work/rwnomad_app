import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/api_client.dart';
import '../../core/api/api_endpoints.dart';
import '../models/job/paging_job_response.dart';
import '../models/common/page_response.dart';

final favoriteRemoteSourceProvider = Provider<FavoriteRemoteSource>((ref) {
  return FavoriteRemoteSource(ref.read(dioProvider));
});

class FavoriteRemoteSource {
  final Dio _dio;
  FavoriteRemoteSource(this._dio);

  Future<PageResponse<PagingJobResponse>> getFavorites({
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      ApiEndpoints.favorites,
      queryParameters: {'page': page, 'size': size},
    );
    return PageResponse.fromJson(
      response.data,
      (json) => PagingJobResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> addFavorite(int jobId) async {
    await _dio.post(
      '/favorites',
      data: {
        'type': 'REMOTE_WORK',
        'relatedDataId': jobId,
        'time': DateTime.now().toUtc().toIso8601String(),
      },
    );
  }

  Future<void> removeFavorite(int jobId) async {
    await _dio.delete('/favorites/REMOTE_WORK/$jobId');
  }

  Future<PageResponse<PagingJobResponse>> getAppliedJobs({
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      '/apply/jobs',
      queryParameters: {'page': page, 'size': size},
    );
    return PageResponse.fromJson(
      response.data,
      (json) => PagingJobResponse.fromJson(json as Map<String, dynamic>),
    );
  }
}
