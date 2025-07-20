// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stamp_rally_event_notion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StampRallyEventNotionModelImpl _$$StampRallyEventNotionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StampRallyEventNotionModelImpl(
      id: json['id'] as String?,
      code: json['code'] as String?,
      title: json['title'] as String?,
      position: json['position'] as String?,
      url: json['url'] as String?,
      image: json['image'] as String?,
      period: json['period'] as String?,
    );

Map<String, dynamic> _$$StampRallyEventNotionModelImplToJson(
        _$StampRallyEventNotionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'position': instance.position,
      'url': instance.url,
      'image': instance.image,
      'period': instance.period,
    };
