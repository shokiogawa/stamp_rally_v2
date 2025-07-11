import 'package:freezed_annotation/freezed_annotation.dart';

part 'own_worship_card_data.freezed.dart';

part 'own_worship_card_data.g.dart';

@freezed
class OwnWorshipCardData with _$OwnWorshipCardData {
  const factory OwnWorshipCardData({
    @JsonKey(name: 'id_worship_card') int? idWorshipCard,
    @JsonKey(name: 'id_user') int? idUser,
    @JsonKey(name: 'number') String? number,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _OwnWorshipCardData;

  const OwnWorshipCardData._();

  factory OwnWorshipCardData.create(
      int idWorshipCard, int idUser, String? currentNumber) {
    currentNumber ??= '0000';
    // 文字列を数値に変換して1を足す
    final num = int.parse(currentNumber) + 1;
    // 数値をゼロ埋めして再び文字列に変換
    final newNumber = num.toString().padLeft(4, '0');

    return OwnWorshipCardData(
      idWorshipCard: idWorshipCard,
      idUser: idUser,
      number: newNumber,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  // データをjson化
  factory OwnWorshipCardData.fromJson(Map<String, dynamic> json) =>
      _$OwnWorshipCardDataFromJson(json);
}
