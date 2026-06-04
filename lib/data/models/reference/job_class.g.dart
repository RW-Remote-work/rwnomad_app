// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobClassImpl _$$JobClassImplFromJson(Map<String, dynamic> json) =>
    _$JobClassImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      jobCount: (json['jobCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$JobClassImplToJson(_$JobClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jobCount': instance.jobCount,
    };
