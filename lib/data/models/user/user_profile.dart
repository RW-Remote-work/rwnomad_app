import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
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
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
