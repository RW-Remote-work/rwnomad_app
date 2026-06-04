// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JobClass _$JobClassFromJson(Map<String, dynamic> json) {
  return _JobClass.fromJson(json);
}

/// @nodoc
mixin _$JobClass {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'jobCount')
  int? get jobCount => throw _privateConstructorUsedError;

  /// Serializes this JobClass to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobClassCopyWith<JobClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobClassCopyWith<$Res> {
  factory $JobClassCopyWith(JobClass value, $Res Function(JobClass) then) =
      _$JobClassCopyWithImpl<$Res, JobClass>;
  @useResult
  $Res call({int? id, String? name, @JsonKey(name: 'jobCount') int? jobCount});
}

/// @nodoc
class _$JobClassCopyWithImpl<$Res, $Val extends JobClass>
    implements $JobClassCopyWith<$Res> {
  _$JobClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? jobCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobCount: freezed == jobCount
                ? _value.jobCount
                : jobCount // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobClassImplCopyWith<$Res>
    implements $JobClassCopyWith<$Res> {
  factory _$$JobClassImplCopyWith(
    _$JobClassImpl value,
    $Res Function(_$JobClassImpl) then,
  ) = __$$JobClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, @JsonKey(name: 'jobCount') int? jobCount});
}

/// @nodoc
class __$$JobClassImplCopyWithImpl<$Res>
    extends _$JobClassCopyWithImpl<$Res, _$JobClassImpl>
    implements _$$JobClassImplCopyWith<$Res> {
  __$$JobClassImplCopyWithImpl(
    _$JobClassImpl _value,
    $Res Function(_$JobClassImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? jobCount = freezed,
  }) {
    return _then(
      _$JobClassImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobCount: freezed == jobCount
            ? _value.jobCount
            : jobCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobClassImpl implements _JobClass {
  const _$JobClassImpl({
    this.id,
    this.name,
    @JsonKey(name: 'jobCount') this.jobCount,
  });

  factory _$JobClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobClassImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'jobCount')
  final int? jobCount;

  @override
  String toString() {
    return 'JobClass(id: $id, name: $name, jobCount: $jobCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobClassImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.jobCount, jobCount) ||
                other.jobCount == jobCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, jobCount);

  /// Create a copy of JobClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobClassImplCopyWith<_$JobClassImpl> get copyWith =>
      __$$JobClassImplCopyWithImpl<_$JobClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobClassImplToJson(this);
  }
}

abstract class _JobClass implements JobClass {
  const factory _JobClass({
    final int? id,
    final String? name,
    @JsonKey(name: 'jobCount') final int? jobCount,
  }) = _$JobClassImpl;

  factory _JobClass.fromJson(Map<String, dynamic> json) =
      _$JobClassImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'jobCount')
  int? get jobCount;

  /// Create a copy of JobClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobClassImplCopyWith<_$JobClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
