// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      country: json['country'] as String?,
      countryId: (json['countryId'] as num?)?.toInt(),
      city: json['city'] as String?,
      areaId: (json['areaId'] as num?)?.toInt(),
      labelList: (json['labelList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hobbyList: (json['hobbyList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      selfIntroduction: json['selfIntroduction'] as String?,
      communityRankName: json['communityRankName'] as String?,
      authorityList: (json['authorityList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      invitationCode: json['invitationCode'] as String?,
      membershipType: json['membershipType'] as String?,
      membershipStartTime: json['membershipStartTime'] as String?,
      membershipEndTime: json['membershipEndTime'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'country': instance.country,
      'countryId': instance.countryId,
      'city': instance.city,
      'areaId': instance.areaId,
      'labelList': instance.labelList,
      'hobbyList': instance.hobbyList,
      'selfIntroduction': instance.selfIntroduction,
      'communityRankName': instance.communityRankName,
      'authorityList': instance.authorityList,
      'invitationCode': instance.invitationCode,
      'membershipType': instance.membershipType,
      'membershipStartTime': instance.membershipStartTime,
      'membershipEndTime': instance.membershipEndTime,
    };
