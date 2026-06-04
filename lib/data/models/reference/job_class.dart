import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_class.freezed.dart';
part 'job_class.g.dart';

@freezed
class JobClass with _$JobClass {
  const factory JobClass({
    int? id,
    String? name,
    @JsonKey(name: 'jobCount') int? jobCount,
  }) = _JobClass;

  factory JobClass.fromJson(Map<String, dynamic> json) =>
      _$JobClassFromJson(json);
}
