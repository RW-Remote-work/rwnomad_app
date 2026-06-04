// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageResponseImpl<T> _$$PageResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$PageResponseImpl<T>(
  size: (json['size'] as num?)?.toInt(),
  current: (json['current'] as num?)?.toInt(),
  records: (json['records'] as List<dynamic>?)?.map(fromJsonT).toList(),
  total: (json['total'] as num?)?.toInt(),
  pages: (json['pages'] as num?)?.toInt(),
);

Map<String, dynamic> _$$PageResponseImplToJson<T>(
  _$PageResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'size': instance.size,
  'current': instance.current,
  'records': instance.records?.map(toJsonT).toList(),
  'total': instance.total,
  'pages': instance.pages,
};
