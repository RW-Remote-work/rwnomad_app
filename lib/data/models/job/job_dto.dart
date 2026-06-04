import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_dto.freezed.dart';
part 'job_dto.g.dart';

@freezed
class JobDTO with _$JobDTO {
  const factory JobDTO({
    int? id,
    String? name,
    @JsonKey(name: 'jobClassId') int? jobClassId,
    String? type,
    @JsonKey(name: 'countryId') int? countryId,
    @JsonKey(name: 'currencyId') int? currencyId,
    @JsonKey(name: 'salaryMin') int? salaryMin,
    @JsonKey(name: 'salaryMax') int? salaryMax,
    @JsonKey(name: 'salaryType') String? salaryType,
    String? duty,
    String? requirement,
    @JsonKey(name: 'companyInfo') String? companyInfo,
    String? status,
    @JsonKey(name: 'publisherId') int? publisherId,
    @JsonKey(name: 'publishTime') String? publishTime,
    String? remark,
    @JsonKey(name: 'publisherType') String? publisherType,
    String? source,
    @JsonKey(name: 'recommendFlag') int? recommendFlag,
    @JsonKey(name: 'jobClassName') String? jobClassName,
    @JsonKey(name: 'currencyName') String? currencyName,
    @JsonKey(name: 'currencyCode') String? currencyCode,
    @JsonKey(name: 'countryName') String? countryName,
    @JsonKey(name: 'countryEngName') String? countryEngName,
    @JsonKey(name: 'publisherName') String? publisherName,
    @JsonKey(name: 'publisherAvatar') String? publisherAvatar,
  }) = _JobDTO;

  factory JobDTO.fromJson(Map<String, dynamic> json) =>
      _$JobDTOFromJson(json);
}
