import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_filter.freezed.dart';
part 'job_filter.g.dart';

@freezed
class JobFilter with _$JobFilter {
  const factory JobFilter({
    @JsonKey(name: 'jobClassIdList') List<int>? jobClassIdList,
    @JsonKey(name: 'typeList') List<String>? typeList,
    @JsonKey(name: 'countryId') int? countryId,
    String? name,
    @JsonKey(name: 'publisherId') int? publisherId,
    @JsonKey(name: 'publishDate') String? publishDate,
    @JsonKey(name: 'recommendFlag') int? recommendFlag,
    String? sortBy,
  }) = _JobFilter;

  factory JobFilter.fromJson(Map<String, dynamic> json) =>
      _$JobFilterFromJson(json);
}
