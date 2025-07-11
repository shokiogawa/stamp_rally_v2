// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worship_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorshipCardDataImpl _$$WorshipCardDataImplFromJson(
        Map<String, dynamic> json) =>
    _$WorshipCardDataImpl(
      id: (json['id'] as num).toInt(),
      idShrine: (json['id_shrine'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      comment: json['comment'] as String,
      isCurrent: json['is_current'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$WorshipCardDataImplToJson(
        _$WorshipCardDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_shrine': instance.idShrine,
      'number': instance.number,
      'comment': instance.comment,
      'is_current': instance.isCurrent,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
