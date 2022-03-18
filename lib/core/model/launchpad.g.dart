// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launchpad _$LaunchpadFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launchpad',
      json,
      ($checkedConvert) {
        final val = Launchpad(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String?),
          fullName: $checkedConvert('full_name', (v) => v as String?),
          locality: $checkedConvert('locality', (v) => v as String?),
          region: $checkedConvert('region', (v) => v as String?),
          latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
          longitude:
              $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
          launchAttempts: $checkedConvert('launch_attempts', (v) => v as int?),
          launchSuccesses:
              $checkedConvert('launch_successes', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'fullName': 'full_name',
        'launchAttempts': 'launch_attempts',
        'launchSuccesses': 'launch_successes'
      },
    );

Map<String, dynamic> _$LaunchpadToJson(Launchpad instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'locality': instance.locality,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'launch_attempts': instance.launchAttempts,
      'launch_successes': instance.launchSuccesses,
    };
