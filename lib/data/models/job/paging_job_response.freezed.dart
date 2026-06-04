// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_job_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PagingJobResponse _$PagingJobResponseFromJson(Map<String, dynamic> json) {
  return _PagingJobResponse.fromJson(json);
}

/// @nodoc
mixin _$PagingJobResponse {
  JobDTO? get job => throw _privateConstructorUsedError;
  @JsonKey(name: 'favoriteCount')
  int? get favoriteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFavorite')
  bool? get isFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'isApply')
  bool? get isApply => throw _privateConstructorUsedError;
  List<Label>? get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'blurEffect')
  bool? get blurEffect => throw _privateConstructorUsedError;
  @JsonKey(name: 'toDayViewCount')
  int? get toDayViewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'matchScore')
  double? get matchScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'optimizedResumeUrl')
  String? get optimizedResumeUrl => throw _privateConstructorUsedError;

  /// Serializes this PagingJobResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PagingJobResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PagingJobResponseCopyWith<PagingJobResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagingJobResponseCopyWith<$Res> {
  factory $PagingJobResponseCopyWith(
    PagingJobResponse value,
    $Res Function(PagingJobResponse) then,
  ) = _$PagingJobResponseCopyWithImpl<$Res, PagingJobResponse>;
  @useResult
  $Res call({
    JobDTO? job,
    @JsonKey(name: 'favoriteCount') int? favoriteCount,
    @JsonKey(name: 'isFavorite') bool? isFavorite,
    @JsonKey(name: 'isApply') bool? isApply,
    List<Label>? labels,
    @JsonKey(name: 'blurEffect') bool? blurEffect,
    @JsonKey(name: 'toDayViewCount') int? toDayViewCount,
    @JsonKey(name: 'matchScore') double? matchScore,
    @JsonKey(name: 'optimizedResumeUrl') String? optimizedResumeUrl,
  });

  $JobDTOCopyWith<$Res>? get job;
}

/// @nodoc
class _$PagingJobResponseCopyWithImpl<$Res, $Val extends PagingJobResponse>
    implements $PagingJobResponseCopyWith<$Res> {
  _$PagingJobResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PagingJobResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = freezed,
    Object? favoriteCount = freezed,
    Object? isFavorite = freezed,
    Object? isApply = freezed,
    Object? labels = freezed,
    Object? blurEffect = freezed,
    Object? toDayViewCount = freezed,
    Object? matchScore = freezed,
    Object? optimizedResumeUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            job: freezed == job
                ? _value.job
                : job // ignore: cast_nullable_to_non_nullable
                      as JobDTO?,
            favoriteCount: freezed == favoriteCount
                ? _value.favoriteCount
                : favoriteCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            isFavorite: freezed == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isApply: freezed == isApply
                ? _value.isApply
                : isApply // ignore: cast_nullable_to_non_nullable
                      as bool?,
            labels: freezed == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as List<Label>?,
            blurEffect: freezed == blurEffect
                ? _value.blurEffect
                : blurEffect // ignore: cast_nullable_to_non_nullable
                      as bool?,
            toDayViewCount: freezed == toDayViewCount
                ? _value.toDayViewCount
                : toDayViewCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            matchScore: freezed == matchScore
                ? _value.matchScore
                : matchScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            optimizedResumeUrl: freezed == optimizedResumeUrl
                ? _value.optimizedResumeUrl
                : optimizedResumeUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of PagingJobResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JobDTOCopyWith<$Res>? get job {
    if (_value.job == null) {
      return null;
    }

    return $JobDTOCopyWith<$Res>(_value.job!, (value) {
      return _then(_value.copyWith(job: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PagingJobResponseImplCopyWith<$Res>
    implements $PagingJobResponseCopyWith<$Res> {
  factory _$$PagingJobResponseImplCopyWith(
    _$PagingJobResponseImpl value,
    $Res Function(_$PagingJobResponseImpl) then,
  ) = __$$PagingJobResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    JobDTO? job,
    @JsonKey(name: 'favoriteCount') int? favoriteCount,
    @JsonKey(name: 'isFavorite') bool? isFavorite,
    @JsonKey(name: 'isApply') bool? isApply,
    List<Label>? labels,
    @JsonKey(name: 'blurEffect') bool? blurEffect,
    @JsonKey(name: 'toDayViewCount') int? toDayViewCount,
    @JsonKey(name: 'matchScore') double? matchScore,
    @JsonKey(name: 'optimizedResumeUrl') String? optimizedResumeUrl,
  });

  @override
  $JobDTOCopyWith<$Res>? get job;
}

/// @nodoc
class __$$PagingJobResponseImplCopyWithImpl<$Res>
    extends _$PagingJobResponseCopyWithImpl<$Res, _$PagingJobResponseImpl>
    implements _$$PagingJobResponseImplCopyWith<$Res> {
  __$$PagingJobResponseImplCopyWithImpl(
    _$PagingJobResponseImpl _value,
    $Res Function(_$PagingJobResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PagingJobResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = freezed,
    Object? favoriteCount = freezed,
    Object? isFavorite = freezed,
    Object? isApply = freezed,
    Object? labels = freezed,
    Object? blurEffect = freezed,
    Object? toDayViewCount = freezed,
    Object? matchScore = freezed,
    Object? optimizedResumeUrl = freezed,
  }) {
    return _then(
      _$PagingJobResponseImpl(
        job: freezed == job
            ? _value.job
            : job // ignore: cast_nullable_to_non_nullable
                  as JobDTO?,
        favoriteCount: freezed == favoriteCount
            ? _value.favoriteCount
            : favoriteCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        isFavorite: freezed == isFavorite
            ? _value.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isApply: freezed == isApply
            ? _value.isApply
            : isApply // ignore: cast_nullable_to_non_nullable
                  as bool?,
        labels: freezed == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as List<Label>?,
        blurEffect: freezed == blurEffect
            ? _value.blurEffect
            : blurEffect // ignore: cast_nullable_to_non_nullable
                  as bool?,
        toDayViewCount: freezed == toDayViewCount
            ? _value.toDayViewCount
            : toDayViewCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        matchScore: freezed == matchScore
            ? _value.matchScore
            : matchScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        optimizedResumeUrl: freezed == optimizedResumeUrl
            ? _value.optimizedResumeUrl
            : optimizedResumeUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PagingJobResponseImpl implements _PagingJobResponse {
  const _$PagingJobResponseImpl({
    this.job,
    @JsonKey(name: 'favoriteCount') this.favoriteCount,
    @JsonKey(name: 'isFavorite') this.isFavorite,
    @JsonKey(name: 'isApply') this.isApply,
    final List<Label>? labels,
    @JsonKey(name: 'blurEffect') this.blurEffect,
    @JsonKey(name: 'toDayViewCount') this.toDayViewCount,
    @JsonKey(name: 'matchScore') this.matchScore,
    @JsonKey(name: 'optimizedResumeUrl') this.optimizedResumeUrl,
  }) : _labels = labels;

  factory _$PagingJobResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagingJobResponseImplFromJson(json);

  @override
  final JobDTO? job;
  @override
  @JsonKey(name: 'favoriteCount')
  final int? favoriteCount;
  @override
  @JsonKey(name: 'isFavorite')
  final bool? isFavorite;
  @override
  @JsonKey(name: 'isApply')
  final bool? isApply;
  final List<Label>? _labels;
  @override
  List<Label>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'blurEffect')
  final bool? blurEffect;
  @override
  @JsonKey(name: 'toDayViewCount')
  final int? toDayViewCount;
  @override
  @JsonKey(name: 'matchScore')
  final double? matchScore;
  @override
  @JsonKey(name: 'optimizedResumeUrl')
  final String? optimizedResumeUrl;

  @override
  String toString() {
    return 'PagingJobResponse(job: $job, favoriteCount: $favoriteCount, isFavorite: $isFavorite, isApply: $isApply, labels: $labels, blurEffect: $blurEffect, toDayViewCount: $toDayViewCount, matchScore: $matchScore, optimizedResumeUrl: $optimizedResumeUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagingJobResponseImpl &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.favoriteCount, favoriteCount) ||
                other.favoriteCount == favoriteCount) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isApply, isApply) || other.isApply == isApply) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.blurEffect, blurEffect) ||
                other.blurEffect == blurEffect) &&
            (identical(other.toDayViewCount, toDayViewCount) ||
                other.toDayViewCount == toDayViewCount) &&
            (identical(other.matchScore, matchScore) ||
                other.matchScore == matchScore) &&
            (identical(other.optimizedResumeUrl, optimizedResumeUrl) ||
                other.optimizedResumeUrl == optimizedResumeUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    job,
    favoriteCount,
    isFavorite,
    isApply,
    const DeepCollectionEquality().hash(_labels),
    blurEffect,
    toDayViewCount,
    matchScore,
    optimizedResumeUrl,
  );

  /// Create a copy of PagingJobResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PagingJobResponseImplCopyWith<_$PagingJobResponseImpl> get copyWith =>
      __$$PagingJobResponseImplCopyWithImpl<_$PagingJobResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PagingJobResponseImplToJson(this);
  }
}

abstract class _PagingJobResponse implements PagingJobResponse {
  const factory _PagingJobResponse({
    final JobDTO? job,
    @JsonKey(name: 'favoriteCount') final int? favoriteCount,
    @JsonKey(name: 'isFavorite') final bool? isFavorite,
    @JsonKey(name: 'isApply') final bool? isApply,
    final List<Label>? labels,
    @JsonKey(name: 'blurEffect') final bool? blurEffect,
    @JsonKey(name: 'toDayViewCount') final int? toDayViewCount,
    @JsonKey(name: 'matchScore') final double? matchScore,
    @JsonKey(name: 'optimizedResumeUrl') final String? optimizedResumeUrl,
  }) = _$PagingJobResponseImpl;

  factory _PagingJobResponse.fromJson(Map<String, dynamic> json) =
      _$PagingJobResponseImpl.fromJson;

  @override
  JobDTO? get job;
  @override
  @JsonKey(name: 'favoriteCount')
  int? get favoriteCount;
  @override
  @JsonKey(name: 'isFavorite')
  bool? get isFavorite;
  @override
  @JsonKey(name: 'isApply')
  bool? get isApply;
  @override
  List<Label>? get labels;
  @override
  @JsonKey(name: 'blurEffect')
  bool? get blurEffect;
  @override
  @JsonKey(name: 'toDayViewCount')
  int? get toDayViewCount;
  @override
  @JsonKey(name: 'matchScore')
  double? get matchScore;
  @override
  @JsonKey(name: 'optimizedResumeUrl')
  String? get optimizedResumeUrl;

  /// Create a copy of PagingJobResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagingJobResponseImplCopyWith<_$PagingJobResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
