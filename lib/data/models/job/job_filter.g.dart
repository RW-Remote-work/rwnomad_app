// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobFilterImpl _$$JobFilterImplFromJson(Map<String, dynamic> json) =>
    _$JobFilterImpl(
      jobClassIdList: (json['jobClassIdList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      typeList: (json['typeList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      countryId: (json['countryId'] as num?)?.toInt(),
      name: json['name'] as String?,
      publisherId: (json['publisherId'] as num?)?.toInt(),
      publishDate: json['publishDate'] as String?,
      recommendFlag: (json['recommendFlag'] as num?)?.toInt(),
      sortBy: json['sortBy'] as String?,
    );

Map<String, dynamic> _$$JobFilterImplToJson(_$JobFilterImpl instance) =>
    <String, dynamic>{
      'jobClassIdList': instance.jobClassIdList,
      'typeList': instance.typeList,
      'countryId': instance.countryId,
      'name': instance.name,
      'publisherId': instance.publisherId,
      'publishDate': instance.publishDate,
      'recommendFlag': instance.recommendFlag,
      'sortBy': instance.sortBy,
    };
