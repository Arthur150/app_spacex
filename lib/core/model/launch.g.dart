// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launch',
      json,
      ($checkedConvert) {
        final val = Launch(
          id: $checkedConvert('id', (v) => v as String),
          fairing: $checkedConvert(
              'fairing',
              (v) => v == null
                  ? null
                  : Fairing.fromJson(v as Map<String, dynamic>)),
          links: $checkedConvert(
              'links',
              (v) =>
                  v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
          rocket: $checkedConvert('rocket', (v) => v as String?),
          success: $checkedConvert('success', (v) => v as bool?),
          details: $checkedConvert('details', (v) => v as String?),
          flightNumber: $checkedConvert('flight_number', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          dateUTC: $checkedConvert('date_utc', (v) => v as String?),
          staticFireDateUTC:
              $checkedConvert('static_fire_date_utc', (v) => v as String?),
          upcoming: $checkedConvert('upcoming', (v) => v as bool?),
        );
        $checkedConvert('launchpad', (v) => val.launchpadId = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'flightNumber': 'flight_number',
        'dateUTC': 'date_utc',
        'staticFireDateUTC': 'static_fire_date_utc',
        'launchpadId': 'launchpad'
      },
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'id': instance.id,
      'fairing': instance.fairing?.toJson(),
      'links': instance.links?.toJson(),
      'rocket': instance.rocket,
      'success': instance.success,
      'details': instance.details,
      'launchpad': instance.launchpadId,
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_utc': instance.dateUTC,
      'static_fire_date_utc': instance.staticFireDateUTC,
      'upcoming': instance.upcoming,
    };
