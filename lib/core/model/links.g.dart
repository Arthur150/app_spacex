// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Links',
      json,
      ($checkedConvert) {
        final val = Links(
          patch: $checkedConvert(
              'patch',
              (v) =>
                  v == null ? null : Patch.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch?.toJson(),
    };
