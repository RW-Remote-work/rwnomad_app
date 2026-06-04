// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JobFilter _$JobFilterFromJson(Map<String, dynamic> json) {
  return _JobFilter.fromJson(json);
}

/// @nodoc
mixin _$JobFilter {
  @JsonKey(name: 'jobClassIdList')
  List<int>? get jobClassIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'typeList')
  List<String>? get typeList => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryId')
  int? get countryId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'publisherId')
  int? get publisherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishDate')
  String? get publishDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'recommendFlag')
  int? get recommendFlag => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;

  /// Serializes this JobFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobFilterCopyWith<JobFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobFilterCopyWith<$Res> {
  factory $JobFilterCopyWith(JobFilter value, $Res Function(JobFilter) then) =
      _$JobFilterCopyWithImpl<$Res, JobFilter>;
  @useResult
  $Res call({
    @JsonKey(name: 'jobClassIdList') List<int>? jobClassIdList,
    @JsonKey(name: 'typeList') List<String>? typeList,
    @JsonKey(name: 'countryId') int? countryId,
    String? name,
    @JsonKey(name: 'publisherId') int? publisherId,
    @JsonKey(name: 'publishDate') String? publishDate,
    @JsonKey(name: 'recommendFlag') int? recommendFlag,
    String? sortBy,
  });
}

/// @nodoc
class _$JobFilterCopyWithImpl<$Res, $Val extends JobFilter>
    implements $JobFilterCopyWith<$Res> {
  _$JobFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobClassIdList = freezed,
    Object? typeList = freezed,
    Object? countryId = freezed,
    Object? name = freezed,
    Object? publisherId = freezed,
    Object? publishDate = freezed,
    Object? recommendFlag = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(
      _value.copyWith(
            jobClassIdList: freezed == jobClassIdList
                ? _value.jobClassIdList
                : jobClassIdList // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            typeList: freezed == typeList
                ? _value.typeList
                : typeList // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            countryId: freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            publisherId: freezed == publisherId
                ? _value.publisherId
                : publisherId // ignore: cast_nullable_to_non_nullable
                      as int?,
            publishDate: freezed == publishDate
                ? _value.publishDate
                : publishDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            recommendFlag: freezed == recommendFlag
                ? _value.recommendFlag
                : recommendFlag // ignore: cast_nullable_to_non_nullable
                      as int?,
            sortBy: freezed == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobFilterImplCopyWith<$Res>
    implements $JobFilterCopyWith<$Res> {
  factory _$$JobFilterImplCopyWith(
    _$JobFilterImpl value,
    $Res Function(_$JobFilterImpl) then,
  ) = __$$JobFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'jobClassIdList') List<int>? jobClassIdList,
    @JsonKey(name: 'typeList') List<String>? typeList,
    @JsonKey(name: 'countryId') int? countryId,
    String? name,
    @JsonKey(name: 'publisherId') int? publisherId,
    @JsonKey(name: 'publishDate') String? publishDate,
    @JsonKey(name: 'recommendFlag') int? recommendFlag,
    String? sortBy,
  });
}

/// @nodoc
class __$$JobFilterImplCopyWithImpl<$Res>
    extends _$JobFilterCopyWithImpl<$Res, _$JobFilterImpl>
    implements _$$JobFilterImplCopyWith<$Res> {
  __$$JobFilterImplCopyWithImpl(
    _$JobFilterImpl _value,
    $Res Function(_$JobFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobClassIdList = freezed,
    Object? typeList = freezed,
    Object? countryId = freezed,
    Object? name = freezed,
    Object? publisherId = freezed,
    Object? publishDate = freezed,
    Object? recommendFlag = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(
      _$JobFilterImpl(
        jobClassIdList: freezed == jobClassIdList
            ? _value._jobClassIdList
            : jobClassIdList // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        typeList: freezed == typeList
            ? _value._typeList
            : typeList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        countryId: freezed == countryId
            ? _value.countryId
            : countryId // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        publisherId: freezed == publisherId
            ? _value.publisherId
            : publisherId // ignore: cast_nullable_to_non_nullable
                  as int?,
        publishDate: freezed == publishDate
            ? _value.publishDate
            : publishDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        recommendFlag: freezed == recommendFlag
            ? _value.recommendFlag
            : recommendFlag // ignore: cast_nullable_to_non_nullable
                  as int?,
        sortBy: freezed == sortBy
            ? _value.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobFilterImpl implements _JobFilter {
  const _$JobFilterImpl({
    @JsonKey(name: 'jobClassIdList') final List<int>? jobClassIdList,
    @JsonKey(name: 'typeList') final List<String>? typeList,
    @JsonKey(name: 'countryId') this.countryId,
    this.name,
    @JsonKey(name: 'publisherId') this.publisherId,
    @JsonKey(name: 'publishDate') this.publishDate,
    @JsonKey(name: 'recommendFlag') this.recommendFlag,
    this.sortBy,
  }) : _jobClassIdList = jobClassIdList,
       _typeList = typeList;

  factory _$JobFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobFilterImplFromJson(json);

  final List<int>? _jobClassIdList;
  @override
  @JsonKey(name: 'jobClassIdList')
  List<int>? get jobClassIdList {
    final value = _jobClassIdList;
    if (value == null) return null;
    if (_jobClassIdList is EqualUnmodifiableListView) return _jobClassIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _typeList;
  @override
  @JsonKey(name: 'typeList')
  List<String>? get typeList {
    final value = _typeList;
    if (value == null) return null;
    if (_typeList is EqualUnmodifiableListView) return _typeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'countryId')
  final int? countryId;
  @override
  final String? name;
  @override
  @JsonKey(name: 'publisherId')
  final int? publisherId;
  @override
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @override
  @JsonKey(name: 'recommendFlag')
  final int? recommendFlag;
  @override
  final String? sortBy;

  @override
  String toString() {
    return 'JobFilter(jobClassIdList: $jobClassIdList, typeList: $typeList, countryId: $countryId, name: $name, publisherId: $publisherId, publishDate: $publishDate, recommendFlag: $recommendFlag, sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobFilterImpl &&
            const DeepCollectionEquality().equals(
              other._jobClassIdList,
              _jobClassIdList,
            ) &&
            const DeepCollectionEquality().equals(other._typeList, _typeList) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.publisherId, publisherId) ||
                other.publisherId == publisherId) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.recommendFlag, recommendFlag) ||
                other.recommendFlag == recommendFlag) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_jobClassIdList),
    const DeepCollectionEquality().hash(_typeList),
    countryId,
    name,
    publisherId,
    publishDate,
    recommendFlag,
    sortBy,
  );

  /// Create a copy of JobFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobFilterImplCopyWith<_$JobFilterImpl> get copyWith =>
      __$$JobFilterImplCopyWithImpl<_$JobFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobFilterImplToJson(this);
  }
}

abstract class _JobFilter implements JobFilter {
  const factory _JobFilter({
    @JsonKey(name: 'jobClassIdList') final List<int>? jobClassIdList,
    @JsonKey(name: 'typeList') final List<String>? typeList,
    @JsonKey(name: 'countryId') final int? countryId,
    final String? name,
    @JsonKey(name: 'publisherId') final int? publisherId,
    @JsonKey(name: 'publishDate') final String? publishDate,
    @JsonKey(name: 'recommendFlag') final int? recommendFlag,
    final String? sortBy,
  }) = _$JobFilterImpl;

  factory _JobFilter.fromJson(Map<String, dynamic> json) =
      _$JobFilterImpl.fromJson;

  @override
  @JsonKey(name: 'jobClassIdList')
  List<int>? get jobClassIdList;
  @override
  @JsonKey(name: 'typeList')
  List<String>? get typeList;
  @override
  @JsonKey(name: 'countryId')
  int? get countryId;
  @override
  String? get name;
  @override
  @JsonKey(name: 'publisherId')
  int? get publisherId;
  @override
  @JsonKey(name: 'publishDate')
  String? get publishDate;
  @override
  @JsonKey(name: 'recommendFlag')
  int? get recommendFlag;
  @override
  String? get sortBy;

  /// Create a copy of JobFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobFilterImplCopyWith<_$JobFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
