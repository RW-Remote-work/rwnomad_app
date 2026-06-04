// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagingJobResponseImpl _$$PagingJobResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PagingJobResponseImpl(
  job: json['job'] == null
      ? null
      : JobDTO.fromJson(json['job'] as Map<String, dynamic>),
  favoriteCount: (json['favoriteCount'] as num?)?.toInt(),
  isFavorite: json['isFavorite'] as bool?,
  isApply: json['isApply'] as bool?,
  labels: (json['labels'] as List<dynamic>?)
      ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
      .toList(),
  blurEffect: json['blurEffect'] as bool?,
  toDayViewCount: (json['toDayViewCount'] as num?)?.toInt(),
  matchScore: (json['matchScore'] as num?)?.toDouble(),
  optimizedResumeUrl: json['optimizedResumeUrl'] as String?,
);

Map<String, dynamic> _$$PagingJobResponseImplToJson(
  _$PagingJobResponseImpl instance,
) => <String, dynamic>{
  'job': instance.job,
  'favoriteCount': instance.favoriteCount,
  'isFavorite': instance.isFavorite,
  'isApply': instance.isApply,
  'labels': instance.labels,
  'blurEffect': instance.blurEffect,
  'toDayViewCount': instance.toDayViewCount,
  'matchScore': instance.matchScore,
  'optimizedResumeUrl': instance.optimizedResumeUrl,
};
