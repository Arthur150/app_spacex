// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Company',
      json,
      ($checkedConvert) {
        final val = Company(
          id: $checkedConvert('id', (v) => v as String),
          ceo: $checkedConvert('ceo', (v) => v as String?),
          coo: $checkedConvert('coo', (v) => v as String?),
          cto: $checkedConvert('cto', (v) => v as String?),
          ctoPropulsion: $checkedConvert('cto_propulsion', (v) => v as String?),
          employees: $checkedConvert('employees', (v) => v as int?),
          founded: $checkedConvert('founded', (v) => v as int?),
          founder: $checkedConvert('founder', (v) => v as String?),
          headquarters: $checkedConvert(
              'headquarters',
              (v) => v == null
                  ? null
                  : Headquarters.fromJson(v as Map<String, dynamic>)),
          launchSites: $checkedConvert('launch_sites', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          summary: $checkedConvert('summary', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'ctoPropulsion': 'cto_propulsion',
        'launchSites': 'launch_sites'
      },
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'founder': instance.founder,
      'ceo': instance.ceo,
      'cto': instance.cto,
      'coo': instance.coo,
      'cto_propulsion': instance.ctoPropulsion,
      'founded': instance.founded,
      'employees': instance.employees,
      'summary': instance.summary,
      'launch_sites': instance.launchSites,
      'headquarters': instance.headquarters?.toJson(),
    };
