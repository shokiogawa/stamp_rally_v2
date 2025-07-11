// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_worship_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OwnWorshipCardDataImpl _$$OwnWorshipCardDataImplFromJson(
        Map<String, dynamic> json) =>
    _$OwnWorshipCardDataImpl(
      idWorshipCard: (json['id_worship_card'] as num?)?.toInt(),
      idUser: (json['id_user'] as num?)?.toInt(),
      number: json['number'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$OwnWorshipCardDataImplToJson(
        _$OwnWorshipCardDataImpl instance) =>
    <String, dynamic>{
      'id_worship_card': instance.idWorshipCard,
      'id_user': instance.idUser,
      'number': instance.number,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
