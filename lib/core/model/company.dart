import 'package:app_spacex/core/model/headquarters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Company {
  String id;
  String? name;
  String? founder;
  String? ceo;
  String? cto;
  String? coo;
  @JsonKey(name: "cto_propulsion")
  String? ctoPropulsion;
  int? founded;
  int? employees;
  String? summary;
  @JsonKey(name: "launch_sites")
  int? launchSites;
  Headquarters? headquarters;

  Company(
      {required this.id,
      this.ceo,
      this.coo,
      this.cto,
      this.ctoPropulsion,
      this.employees,
      this.founded,
      this.founder,
      this.headquarters,
      this.launchSites,
      this.name,
      this.summary});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
