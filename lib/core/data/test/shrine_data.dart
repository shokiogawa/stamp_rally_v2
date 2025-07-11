import 'package:freezed_annotation/freezed_annotation.dart';

part 'shrine_data.freezed.dart';

part 'shrine_data.g.dart';

enum TypeRegisterStamp { gps, qr, normal }

@freezed
class ShrineData with _$ShrineData {
  const factory ShrineData(
      {required int id,
      @JsonKey(name: 'id_place') required int idPlace,
      required String name,
      @JsonKey(name: 'area_name') required String areaName,
      required String ruby,
      required double latitude,
      required double longitude,
      @JsonKey(name: 'type_register_stamp')
      required TypeRegisterStamp typeRegisterStamp,
      @Default('') String url,
      @JsonKey(name: 'created_at') required DateTime createdAt,
      @JsonKey(name: 'updated_at') required DateTime updatedAt}) = _ShrineData;

  // データをjson化
  factory ShrineData.fromJson(Map<String, dynamic> json) =>
      _$ShrineDataFromJson(json);

  const ShrineData._();
}
