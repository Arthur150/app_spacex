import 'package:json_annotation/json_annotation.dart';

part 'fairing.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Fairing {
  bool? reused;
  @JsonKey(name: "recovery_attempt")
  bool? recoveryAttempt;
  bool? recovered;

  Fairing({this.reused, this.recoveryAttempt, this.recovered});

  factory Fairing.fromJson(Map<String, dynamic> json) =>
      _$FairingFromJson(json);

  Map<String, dynamic> toJson() => _$FairingToJson(this);
}
