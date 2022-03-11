import 'dart:ffi';

import 'package:app_spacex/core/model/fairing.dart';
import 'package:app_spacex/core/model/links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launch {
  String id;
  Fairing? fairing;
  Links? links;
  String? rocket;
  bool? success;
  String? details;
  String? launchpad;
  @JsonKey(name: "flight_number")
  int? flightNumber;
  String? name;
  @JsonKey(name: "date_utc")
  String? dateUTC;
  @JsonKey(name: "static_fire_date_utc")
  String? staticFireDateUTC;
  bool? upcoming;

  Launch(
      {required this.id,
      this.fairing,
      this.links,
      this.rocket,
      this.success,
      this.details,
      this.launchpad,
      this.flightNumber,
      this.name,
      this.dateUTC,
      this.staticFireDateUTC,
      this.upcoming});

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}
