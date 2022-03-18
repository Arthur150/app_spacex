import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launchpad {
  String id;
  String? name;
  @JsonKey(name: "full_name")
  String? fullName;
  String? locality;
  String? region;
  double? latitude;
  double? longitude;
  @JsonKey(name: "launch_attempts")
  int? launchAttempts;
  @JsonKey(name: "launch_successes")
  int? launchSuccesses;

  Launchpad(
      {required this.id,
      this.name,
      this.fullName,
      this.locality,
      this.region,
      this.latitude,
      this.longitude,
      this.launchAttempts,
      this.launchSuccesses});

  factory Launchpad.fromJson(Map<String, dynamic> json) =>
      _$LaunchpadFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchpadToJson(this);
}
