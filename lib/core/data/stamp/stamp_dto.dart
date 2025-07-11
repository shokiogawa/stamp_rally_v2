import 'package:freezed_annotation/freezed_annotation.dart';

part 'stamp_dto.freezed.dart';

part 'stamp_dto.g.dart';

@freezed
class StampDto with _$StampDto {
  const StampDto._();

  const factory StampDto(
      {
      // スタンプを押したスポットのID
      required String historicSpotId,
      required String placeName,
      // スタンプを押した日時のリスト
      @Default([]) List<DateTime> stampedDateTimeList}) = _StampDto;

  // スタンプ登録用のコンストラクタ
  StampDto registerStamp() {
    // 今日の日付を追加
    final listData = List<DateTime>.from(stampedDateTimeList).toList();
    listData.add(DateTime.now());

    // 降順でソート
    listData.sort(((a, b) => b.compareTo(a)));

    //3つまで取得し登録する。
    final registerDateList = listData.take(3).toList();

    return StampDto(
        historicSpotId: historicSpotId,
        placeName: placeName,
        stampedDateTimeList: registerDateList);
  }

  factory StampDto.fromJson(Map<String, dynamic> json) =>
      _$StampDtoFromJson(json);
}
