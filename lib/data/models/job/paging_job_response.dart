import 'package:freezed_annotation/freezed_annotation.dart';
import 'job_dto.dart';
import '../reference/label.dart';

part 'paging_job_response.freezed.dart';
part 'paging_job_response.g.dart';

@freezed
class PagingJobResponse with _$PagingJobResponse {
  const factory PagingJobResponse({
    JobDTO? job,
    @JsonKey(name: 'favoriteCount') int? favoriteCount,
    @JsonKey(name: 'isFavorite') bool? isFavorite,
    @JsonKey(name: 'isApply') bool? isApply,
    List<Label>? labels,
    @JsonKey(name: 'blurEffect') bool? blurEffect,
    @JsonKey(name: 'toDayViewCount') int? toDayViewCount,
    @JsonKey(name: 'matchScore') double? matchScore,
    @JsonKey(name: 'optimizedResumeUrl') String? optimizedResumeUrl,
  }) = _PagingJobResponse;

  factory PagingJobResponse.fromJson(Map<String, dynamic> json) =>
      _$PagingJobResponseFromJson(json);
}
