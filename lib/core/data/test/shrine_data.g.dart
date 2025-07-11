// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrine_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShrineDataImpl _$$ShrineDataImplFromJson(Map<String, dynamic> json) =>
    _$ShrineDataImpl(
      id: (json['id'] as num).toInt(),
      idPlace: (json['id_place'] as num).toInt(),
      name: json['name'] as String,
      areaName: json['area_name'] as String,
      ruby: json['ruby'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      typeRegisterStamp:
          $enumDecode(_$TypeRegisterStampEnumMap, json['type_register_stamp']),
      url: json['url'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ShrineDataImplToJson(_$ShrineDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_place': instance.idPlace,
      'name': instance.name,
      'area_name': instance.areaName,
      'ruby': instance.ruby,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type_register_stamp':
          _$TypeRegisterStampEnumMap[instance.typeRegisterStamp]!,
      'url': instance.url,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$TypeRegisterStampEnumMap = {
  TypeRegisterStamp.gps: 'gps',
  TypeRegisterStamp.qr: 'qr',
  TypeRegisterStamp.normal: 'normal',
};
