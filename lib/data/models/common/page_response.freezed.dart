// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PageResponse<T> _$PageResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _PageResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PageResponse<T> {
  int? get size => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  List<T>? get records => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get pages => throw _privateConstructorUsedError;

  /// Serializes this PageResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageResponseCopyWith<T, PageResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageResponseCopyWith<T, $Res> {
  factory $PageResponseCopyWith(
    PageResponse<T> value,
    $Res Function(PageResponse<T>) then,
  ) = _$PageResponseCopyWithImpl<T, $Res, PageResponse<T>>;
  @useResult
  $Res call({
    int? size,
    int? current,
    List<T>? records,
    int? total,
    int? pages,
  });
}

/// @nodoc
class _$PageResponseCopyWithImpl<T, $Res, $Val extends PageResponse<T>>
    implements $PageResponseCopyWith<T, $Res> {
  _$PageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = freezed,
    Object? current = freezed,
    Object? records = freezed,
    Object? total = freezed,
    Object? pages = freezed,
  }) {
    return _then(
      _value.copyWith(
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
            current: freezed == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                      as int?,
            records: freezed == records
                ? _value.records
                : records // ignore: cast_nullable_to_non_nullable
                      as List<T>?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int?,
            pages: freezed == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PageResponseImplCopyWith<T, $Res>
    implements $PageResponseCopyWith<T, $Res> {
  factory _$$PageResponseImplCopyWith(
    _$PageResponseImpl<T> value,
    $Res Function(_$PageResponseImpl<T>) then,
  ) = __$$PageResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    int? size,
    int? current,
    List<T>? records,
    int? total,
    int? pages,
  });
}

/// @nodoc
class __$$PageResponseImplCopyWithImpl<T, $Res>
    extends _$PageResponseCopyWithImpl<T, $Res, _$PageResponseImpl<T>>
    implements _$$PageResponseImplCopyWith<T, $Res> {
  __$$PageResponseImplCopyWithImpl(
    _$PageResponseImpl<T> _value,
    $Res Function(_$PageResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = freezed,
    Object? current = freezed,
    Object? records = freezed,
    Object? total = freezed,
    Object? pages = freezed,
  }) {
    return _then(
      _$PageResponseImpl<T>(
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
        current: freezed == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                  as int?,
        records: freezed == records
            ? _value._records
            : records // ignore: cast_nullable_to_non_nullable
                  as List<T>?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int?,
        pages: freezed == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PageResponseImpl<T> implements _PageResponse<T> {
  const _$PageResponseImpl({
    this.size,
    this.current,
    final List<T>? records,
    this.total,
    this.pages,
  }) : _records = records;

  factory _$PageResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$PageResponseImplFromJson(json, fromJsonT);

  @override
  final int? size;
  @override
  final int? current;
  final List<T>? _records;
  @override
  List<T>? get records {
    final value = _records;
    if (value == null) return null;
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;
  @override
  final int? pages;

  @override
  String toString() {
    return 'PageResponse<$T>(size: $size, current: $current, records: $records, total: $total, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageResponseImpl<T> &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    size,
    current,
    const DeepCollectionEquality().hash(_records),
    total,
    pages,
  );

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageResponseImplCopyWith<T, _$PageResponseImpl<T>> get copyWith =>
      __$$PageResponseImplCopyWithImpl<T, _$PageResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PageResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _PageResponse<T> implements PageResponse<T> {
  const factory _PageResponse({
    final int? size,
    final int? current,
    final List<T>? records,
    final int? total,
    final int? pages,
  }) = _$PageResponseImpl<T>;

  factory _PageResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$PageResponseImpl<T>.fromJson;

  @override
  int? get size;
  @override
  int? get current;
  @override
  List<T>? get records;
  @override
  int? get total;
  @override
  int? get pages;

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageResponseImplCopyWith<T, _$PageResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
