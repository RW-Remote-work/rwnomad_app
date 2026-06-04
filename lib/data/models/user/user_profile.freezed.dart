// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  int? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName')
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatarUrl')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryId')
  int? get countryId => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'areaId')
  int? get areaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'labelList')
  List<String>? get labelList => throw _privateConstructorUsedError;
  @JsonKey(name: 'hobbyList')
  List<String>? get hobbyList => throw _privateConstructorUsedError;
  @JsonKey(name: 'selfIntroduction')
  String? get selfIntroduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'communityRankName')
  String? get communityRankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorityList')
  List<String>? get authorityList => throw _privateConstructorUsedError;
  @JsonKey(name: 'invitationCode')
  String? get invitationCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'membershipType')
  String? get membershipType => throw _privateConstructorUsedError;
  @JsonKey(name: 'membershipStartTime')
  String? get membershipStartTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'membershipEndTime')
  String? get membershipEndTime => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    int? id,
    String? email,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    String? country,
    @JsonKey(name: 'countryId') int? countryId,
    String? city,
    @JsonKey(name: 'areaId') int? areaId,
    @JsonKey(name: 'labelList') List<String>? labelList,
    @JsonKey(name: 'hobbyList') List<String>? hobbyList,
    @JsonKey(name: 'selfIntroduction') String? selfIntroduction,
    @JsonKey(name: 'communityRankName') String? communityRankName,
    @JsonKey(name: 'authorityList') List<String>? authorityList,
    @JsonKey(name: 'invitationCode') String? invitationCode,
    @JsonKey(name: 'membershipType') String? membershipType,
    @JsonKey(name: 'membershipStartTime') String? membershipStartTime,
    @JsonKey(name: 'membershipEndTime') String? membershipEndTime,
  });
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
    Object? country = freezed,
    Object? countryId = freezed,
    Object? city = freezed,
    Object? areaId = freezed,
    Object? labelList = freezed,
    Object? hobbyList = freezed,
    Object? selfIntroduction = freezed,
    Object? communityRankName = freezed,
    Object? authorityList = freezed,
    Object? invitationCode = freezed,
    Object? membershipType = freezed,
    Object? membershipStartTime = freezed,
    Object? membershipEndTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            country: freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String?,
            countryId: freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                      as int?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            areaId: freezed == areaId
                ? _value.areaId
                : areaId // ignore: cast_nullable_to_non_nullable
                      as int?,
            labelList: freezed == labelList
                ? _value.labelList
                : labelList // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            hobbyList: freezed == hobbyList
                ? _value.hobbyList
                : hobbyList // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            selfIntroduction: freezed == selfIntroduction
                ? _value.selfIntroduction
                : selfIntroduction // ignore: cast_nullable_to_non_nullable
                      as String?,
            communityRankName: freezed == communityRankName
                ? _value.communityRankName
                : communityRankName // ignore: cast_nullable_to_non_nullable
                      as String?,
            authorityList: freezed == authorityList
                ? _value.authorityList
                : authorityList // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            invitationCode: freezed == invitationCode
                ? _value.invitationCode
                : invitationCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            membershipType: freezed == membershipType
                ? _value.membershipType
                : membershipType // ignore: cast_nullable_to_non_nullable
                      as String?,
            membershipStartTime: freezed == membershipStartTime
                ? _value.membershipStartTime
                : membershipStartTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            membershipEndTime: freezed == membershipEndTime
                ? _value.membershipEndTime
                : membershipEndTime // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? email,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    String? country,
    @JsonKey(name: 'countryId') int? countryId,
    String? city,
    @JsonKey(name: 'areaId') int? areaId,
    @JsonKey(name: 'labelList') List<String>? labelList,
    @JsonKey(name: 'hobbyList') List<String>? hobbyList,
    @JsonKey(name: 'selfIntroduction') String? selfIntroduction,
    @JsonKey(name: 'communityRankName') String? communityRankName,
    @JsonKey(name: 'authorityList') List<String>? authorityList,
    @JsonKey(name: 'invitationCode') String? invitationCode,
    @JsonKey(name: 'membershipType') String? membershipType,
    @JsonKey(name: 'membershipStartTime') String? membershipStartTime,
    @JsonKey(name: 'membershipEndTime') String? membershipEndTime,
  });
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
    Object? country = freezed,
    Object? countryId = freezed,
    Object? city = freezed,
    Object? areaId = freezed,
    Object? labelList = freezed,
    Object? hobbyList = freezed,
    Object? selfIntroduction = freezed,
    Object? communityRankName = freezed,
    Object? authorityList = freezed,
    Object? invitationCode = freezed,
    Object? membershipType = freezed,
    Object? membershipStartTime = freezed,
    Object? membershipEndTime = freezed,
  }) {
    return _then(
      _$UserProfileImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        country: freezed == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
        countryId: freezed == countryId
            ? _value.countryId
            : countryId // ignore: cast_nullable_to_non_nullable
                  as int?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        areaId: freezed == areaId
            ? _value.areaId
            : areaId // ignore: cast_nullable_to_non_nullable
                  as int?,
        labelList: freezed == labelList
            ? _value._labelList
            : labelList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        hobbyList: freezed == hobbyList
            ? _value._hobbyList
            : hobbyList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        selfIntroduction: freezed == selfIntroduction
            ? _value.selfIntroduction
            : selfIntroduction // ignore: cast_nullable_to_non_nullable
                  as String?,
        communityRankName: freezed == communityRankName
            ? _value.communityRankName
            : communityRankName // ignore: cast_nullable_to_non_nullable
                  as String?,
        authorityList: freezed == authorityList
            ? _value._authorityList
            : authorityList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        invitationCode: freezed == invitationCode
            ? _value.invitationCode
            : invitationCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipType: freezed == membershipType
            ? _value.membershipType
            : membershipType // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipStartTime: freezed == membershipStartTime
            ? _value.membershipStartTime
            : membershipStartTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipEndTime: freezed == membershipEndTime
            ? _value.membershipEndTime
            : membershipEndTime // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    this.id,
    this.email,
    @JsonKey(name: 'displayName') this.displayName,
    @JsonKey(name: 'avatarUrl') this.avatarUrl,
    this.country,
    @JsonKey(name: 'countryId') this.countryId,
    this.city,
    @JsonKey(name: 'areaId') this.areaId,
    @JsonKey(name: 'labelList') final List<String>? labelList,
    @JsonKey(name: 'hobbyList') final List<String>? hobbyList,
    @JsonKey(name: 'selfIntroduction') this.selfIntroduction,
    @JsonKey(name: 'communityRankName') this.communityRankName,
    @JsonKey(name: 'authorityList') final List<String>? authorityList,
    @JsonKey(name: 'invitationCode') this.invitationCode,
    @JsonKey(name: 'membershipType') this.membershipType,
    @JsonKey(name: 'membershipStartTime') this.membershipStartTime,
    @JsonKey(name: 'membershipEndTime') this.membershipEndTime,
  }) : _labelList = labelList,
       _hobbyList = hobbyList,
       _authorityList = authorityList;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final int? id;
  @override
  final String? email;
  @override
  @JsonKey(name: 'displayName')
  final String? displayName;
  @override
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  @override
  final String? country;
  @override
  @JsonKey(name: 'countryId')
  final int? countryId;
  @override
  final String? city;
  @override
  @JsonKey(name: 'areaId')
  final int? areaId;
  final List<String>? _labelList;
  @override
  @JsonKey(name: 'labelList')
  List<String>? get labelList {
    final value = _labelList;
    if (value == null) return null;
    if (_labelList is EqualUnmodifiableListView) return _labelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _hobbyList;
  @override
  @JsonKey(name: 'hobbyList')
  List<String>? get hobbyList {
    final value = _hobbyList;
    if (value == null) return null;
    if (_hobbyList is EqualUnmodifiableListView) return _hobbyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'selfIntroduction')
  final String? selfIntroduction;
  @override
  @JsonKey(name: 'communityRankName')
  final String? communityRankName;
  final List<String>? _authorityList;
  @override
  @JsonKey(name: 'authorityList')
  List<String>? get authorityList {
    final value = _authorityList;
    if (value == null) return null;
    if (_authorityList is EqualUnmodifiableListView) return _authorityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'invitationCode')
  final String? invitationCode;
  @override
  @JsonKey(name: 'membershipType')
  final String? membershipType;
  @override
  @JsonKey(name: 'membershipStartTime')
  final String? membershipStartTime;
  @override
  @JsonKey(name: 'membershipEndTime')
  final String? membershipEndTime;

  @override
  String toString() {
    return 'UserProfile(id: $id, email: $email, displayName: $displayName, avatarUrl: $avatarUrl, country: $country, countryId: $countryId, city: $city, areaId: $areaId, labelList: $labelList, hobbyList: $hobbyList, selfIntroduction: $selfIntroduction, communityRankName: $communityRankName, authorityList: $authorityList, invitationCode: $invitationCode, membershipType: $membershipType, membershipStartTime: $membershipStartTime, membershipEndTime: $membershipEndTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.areaId, areaId) || other.areaId == areaId) &&
            const DeepCollectionEquality().equals(
              other._labelList,
              _labelList,
            ) &&
            const DeepCollectionEquality().equals(
              other._hobbyList,
              _hobbyList,
            ) &&
            (identical(other.selfIntroduction, selfIntroduction) ||
                other.selfIntroduction == selfIntroduction) &&
            (identical(other.communityRankName, communityRankName) ||
                other.communityRankName == communityRankName) &&
            const DeepCollectionEquality().equals(
              other._authorityList,
              _authorityList,
            ) &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode) &&
            (identical(other.membershipType, membershipType) ||
                other.membershipType == membershipType) &&
            (identical(other.membershipStartTime, membershipStartTime) ||
                other.membershipStartTime == membershipStartTime) &&
            (identical(other.membershipEndTime, membershipEndTime) ||
                other.membershipEndTime == membershipEndTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    displayName,
    avatarUrl,
    country,
    countryId,
    city,
    areaId,
    const DeepCollectionEquality().hash(_labelList),
    const DeepCollectionEquality().hash(_hobbyList),
    selfIntroduction,
    communityRankName,
    const DeepCollectionEquality().hash(_authorityList),
    invitationCode,
    membershipType,
    membershipStartTime,
    membershipEndTime,
  );

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    final int? id,
    final String? email,
    @JsonKey(name: 'displayName') final String? displayName,
    @JsonKey(name: 'avatarUrl') final String? avatarUrl,
    final String? country,
    @JsonKey(name: 'countryId') final int? countryId,
    final String? city,
    @JsonKey(name: 'areaId') final int? areaId,
    @JsonKey(name: 'labelList') final List<String>? labelList,
    @JsonKey(name: 'hobbyList') final List<String>? hobbyList,
    @JsonKey(name: 'selfIntroduction') final String? selfIntroduction,
    @JsonKey(name: 'communityRankName') final String? communityRankName,
    @JsonKey(name: 'authorityList') final List<String>? authorityList,
    @JsonKey(name: 'invitationCode') final String? invitationCode,
    @JsonKey(name: 'membershipType') final String? membershipType,
    @JsonKey(name: 'membershipStartTime') final String? membershipStartTime,
    @JsonKey(name: 'membershipEndTime') final String? membershipEndTime,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  int? get id;
  @override
  String? get email;
  @override
  @JsonKey(name: 'displayName')
  String? get displayName;
  @override
  @JsonKey(name: 'avatarUrl')
  String? get avatarUrl;
  @override
  String? get country;
  @override
  @JsonKey(name: 'countryId')
  int? get countryId;
  @override
  String? get city;
  @override
  @JsonKey(name: 'areaId')
  int? get areaId;
  @override
  @JsonKey(name: 'labelList')
  List<String>? get labelList;
  @override
  @JsonKey(name: 'hobbyList')
  List<String>? get hobbyList;
  @override
  @JsonKey(name: 'selfIntroduction')
  String? get selfIntroduction;
  @override
  @JsonKey(name: 'communityRankName')
  String? get communityRankName;
  @override
  @JsonKey(name: 'authorityList')
  List<String>? get authorityList;
  @override
  @JsonKey(name: 'invitationCode')
  String? get invitationCode;
  @override
  @JsonKey(name: 'membershipType')
  String? get membershipType;
  @override
  @JsonKey(name: 'membershipStartTime')
  String? get membershipStartTime;
  @override
  @JsonKey(name: 'membershipEndTime')
  String? get membershipEndTime;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
