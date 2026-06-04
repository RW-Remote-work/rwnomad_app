import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/api_client.dart';
import '../../core/api/api_endpoints.dart';
import '../models/job/job_filter.dart';
import '../models/job/paging_job_response.dart';
import '../models/common/page_response.dart';

final jobRemoteSourceProvider = Provider<JobRemoteSource>((ref) {
  return JobRemoteSource(ref.read(dioProvider));
});

class JobRemoteSource {
  final Dio _dio;
  JobRemoteSource(this._dio);

  Future<PageResponse<PagingJobResponse>> pagingJob({
    required int page,
    required int size,
    JobFilter? filter,
  }) async {
    // Filter fields go in request body using PagingJobSubscribeRequest format
    final body = <String, dynamic>{};
    if (filter != null) {
      if (filter.jobClassIdList != null && filter.jobClassIdList!.isNotEmpty) {
        body['jobClassIds'] = filter.jobClassIdList;
      }
      if (filter.typeList != null && filter.typeList!.isNotEmpty) {
        body['types'] = filter.typeList;
      }
      if (filter.countryId != null) {
        body['countryIds'] = [filter.countryId];
      }
      if (filter.name != null && filter.name!.isNotEmpty) {
        body['keywords'] = [filter.name];
      }
    }
    // Page/size/sort go as query parameters
    final queryParams = <String, dynamic>{
      'page': page,
      'size': size,
    };
    if (filter?.sortBy != null) {
      queryParams['sort'] = filter!.sortBy;
    }
    final response = await _dio.post(
      ApiEndpoints.jobList,
      queryParameters: queryParams,
      data: body,
    );
    return PageResponse.fromJson(
      response.data,
      (json) => PagingJobResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<PagingJobResponse> getJobDetail(int jobId) async {
    final response =
        await _dio.post('${ApiEndpoints.jobDetail}/$jobId');
    return PagingJobResponse.fromJson(response.data);
  }

  Future<Map<String, dynamic>> applyJob(int jobId) async {
    final response =
        await _dio.post('${ApiEndpoints.jobApply}/$jobId/apply');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getJobDeliver(int jobId) async {
    final response =
        await _dio.get('${ApiEndpoints.jobDeliver}/$jobId/deliver');
    return response.data as Map<String, dynamic>;
  }

  Future<int> getOnlineJobCount() async {
    final response = await _dio.get(ApiEndpoints.jobOnlineCount);
    return response.data as int? ?? 0;
  }
}
