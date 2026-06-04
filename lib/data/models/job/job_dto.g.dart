// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobDTOImpl _$$JobDTOImplFromJson(Map<String, dynamic> json) => _$JobDTOImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  jobClassId: (json['jobClassId'] as num?)?.toInt(),
  type: json['type'] as String?,
  countryId: (json['countryId'] as num?)?.toInt(),
  currencyId: (json['currencyId'] as num?)?.toInt(),
  salaryMin: (json['salaryMin'] as num?)?.toInt(),
  salaryMax: (json['salaryMax'] as num?)?.toInt(),
  salaryType: json['salaryType'] as String?,
  duty: json['duty'] as String?,
  requirement: json['requirement'] as String?,
  companyInfo: json['companyInfo'] as String?,
  status: json['status'] as String?,
  publisherId: (json['publisherId'] as num?)?.toInt(),
  publishTime: json['publishTime'] as String?,
  remark: json['remark'] as String?,
  publisherType: json['publisherType'] as String?,
  source: json['source'] as String?,
  recommendFlag: (json['recommendFlag'] as num?)?.toInt(),
  jobClassName: json['jobClassName'] as String?,
  currencyName: json['currencyName'] as String?,
  currencyCode: json['currencyCode'] as String?,
  countryName: json['countryName'] as String?,
  countryEngName: json['countryEngName'] as String?,
  publisherName: json['publisherName'] as String?,
  publisherAvatar: json['publisherAvatar'] as String?,
);

Map<String, dynamic> _$$JobDTOImplToJson(_$JobDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jobClassId': instance.jobClassId,
      'type': instance.type,
      'countryId': instance.countryId,
      'currencyId': instance.currencyId,
      'salaryMin': instance.salaryMin,
      'salaryMax': instance.salaryMax,
      'salaryType': instance.salaryType,
      'duty': instance.duty,
      'requirement': instance.requirement,
      'companyInfo': instance.companyInfo,
      'status': instance.status,
      'publisherId': instance.publisherId,
      'publishTime': instance.publishTime,
      'remark': instance.remark,
      'publisherType': instance.publisherType,
      'source': instance.source,
      'recommendFlag': instance.recommendFlag,
      'jobClassName': instance.jobClassName,
      'currencyName': instance.currencyName,
      'currencyCode': instance.currencyCode,
      'countryName': instance.countryName,
      'countryEngName': instance.countryEngName,
      'publisherName': instance.publisherName,
      'publisherAvatar': instance.publisherAvatar,
    };
