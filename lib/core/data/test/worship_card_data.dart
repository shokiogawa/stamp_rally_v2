import 'package:freezed_annotation/freezed_annotation.dart';

part 'worship_card_data.freezed.dart';

part 'worship_card_data.g.dart';

@freezed
class WorshipCardData with _$WorshipCardData {
  const factory WorshipCardData({
    required int id,
    @JsonKey(name: 'id_shrine') required int idShrine,
    required int number,
    required String comment,
    @JsonKey(name: 'is_current') required bool isCurrent,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _WorshipCardData;

  // データをjson化
  factory WorshipCardData.fromJson(Map<String, dynamic> json) =>
      _$WorshipCardDataFromJson(json);

  const WorshipCardData._();
}
