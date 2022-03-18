// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fairing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fairing _$FairingFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Fairing',
      json,
      ($checkedConvert) {
        final val = Fairing(
          reused: $checkedConvert('reused', (v) => v as bool?),
          recoveryAttempt:
              $checkedConvert('recovery_attempt', (v) => v as bool?),
          recovered: $checkedConvert('recovered', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'recoveryAttempt': 'recovery_attempt'},
    );

Map<String, dynamic> _$FairingToJson(Fairing instance) => <String, dynamic>{
      'reused': instance.reused,
      'recovery_attempt': instance.recoveryAttempt,
      'recovered': instance.recovered,
    };
