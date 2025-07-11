import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:stamp_rally_v2_fvm/core/data/place/place_csv_model.dart';

part 'place_model.freezed.dart';

@freezed
class PlaceModel with _$PlaceModel {
  const PlaceModel._();

  const factory PlaceModel({
    required String historicSpotId,
    required String name,
    required String areaName,
    required String yomigana,
    required double longitude,
    required double latitude,
    required TypeRegisterStamp typeRegisterStamp,
    @Default(50) int gpsMeter,
    @Default('') String url,
    @Default('') String worshipUrl,
    @Default('参拝カード.png') String img,
    @Default('') String proverbs,
    @Default('') String worshipCardTopUrl,
    DateTime? dateStart,
    DateTime? dateEnd,
    // 説明
    @Default("") String descriptionGpsmeter,
    @Default("") descriptionWeekDays,
    @Default("") descriptionHoliday,

    // スタンプ登録日
    @Default(false) bool isStamped,
  }) = _PlaceModel;

  // 参拝カード取得をweb上にする
  bool get isWorshipCardWeb {
    if (worshipUrl != '') return true;
    return false;
  }

  String get dateStartString {
    return _dateFormat(dateStart);
  }

  String get dateEndString {
    return _dateFormat(dateEnd);
  }

  // yyyy年MM月dd日 HH時mm分 にフォーマットして返す。
  String _dateFormat(DateTime? date) {
    if (date == null) return "";
    DateFormat formatter = DateFormat('yyyy年MM月dd日 HH時mm分');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  // スタンプ登録日を、yyyy/MM/dd(Sat) HH:mmのフォーマットでデータを返す。
  // List<String> get stampedDateTimeListString {
  //   final stringList = stampedDateTimeList.map((e) {
  //     // スタンプ押下時を入れる。
  //     final weekDay = e.weekday;
  //     // Sun Mon Tue Wed Thu Fri Sat
  //     List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  //     final weekDayString = weekdays[weekDay - 1];
  //     final dateString = DateFormat("yyyy/MM/dd").format(e);
  //     final dateTime = DateFormat("HH:mm").format(e);
  //     final da = '$dateString($weekDayString)$dateTime';
  //     return da;
  //   }).toList();

  //   // 3要素まで取得する。
  //   return stringList;
  // }

  // 平日か休日かを判定する
  static bool _isWeekend(DateTime date, List<DateTime> jpHoliday) {
    return date.weekday == DateTime.saturday ||
        date.weekday == DateTime.sunday ||
        jpHoliday.any((holiday) =>
            holiday.year == date.year &&
            holiday.month == date.month &&
            holiday.day == date.day);
  }

  // dateStartを取得する
  static DateTime _getDateStart(PlaceCsvModel data, List<DateTime> jpHolidays) {
    try {
      if (data.dateStart.isNotEmpty) {
        return DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(data.dateStart!)
            .toLocal();
      }

      final baseDate = DateTime.now();
      if (_isWeekend(baseDate, jpHolidays)) {
        // 休日の場合は休日の開始時刻を返す
        final dateStart = DateTime(
            baseDate.year,
            baseDate.month,
            baseDate.day,
            int.parse(data.timeStartHoliday!.split(':')[0]),
            int.parse(data.timeStartHoliday!.split(':')[1]));
        return dateStart;
      } else {
        // 平日の場合は平日の開始時刻を返す
        final dateStart = DateTime(
            baseDate.year,
            baseDate.month,
            baseDate.day,
            int.parse(data.timeStartWeekDays!.split(':')[0]),
            int.parse(data.timeStartWeekDays!.split(':')[1]));
        return dateStart;
      }
    } catch (e) {
      // エラーの場合、dateStartをログに出力

      rethrow;
    }
  }

  // dateEndを取得する
  static DateTime _getDateEnd(PlaceCsvModel data, List<DateTime> jpHolidays) {
    try {
      if (data.dateEnd.isNotEmpty) {
        return DateFormat("yyyy-MM-dd HH:mm:ss").parse(data.dateEnd!).toLocal();
      }
      final baseDate = DateTime.now();
      if (_isWeekend(baseDate, jpHolidays)) {
        // 休日の場合は休日の終了時刻を返す
        return DateTime(
            baseDate.year,
            baseDate.month,
            baseDate.day,
            int.parse(data.timeEndHoliday!.split(':')[0]),
            int.parse(data.timeEndHoliday!.split(':')[1]));
      } else {
        // 平日の場合は平日の終了時刻を返す
        return DateTime(
            baseDate.year,
            baseDate.month,
            baseDate.day,
            int.parse(data.timeEndWeekDays!.split(':')[0]),
            int.parse(data.timeEndWeekDays!.split(':')[1]));
      }
    } catch (e) {
      rethrow;
    }
  }

  static String _descriptionGpsmeter(PlaceCsvModel data) {
    if (data.typeRegisterStamp == TypeRegisterStamp.gps ||
        data.typeRegisterStamp == TypeRegisterStamp.gpsDate) {
      return "※対象場所の${data.gpsMeter}m圏内でスタンプを押すことができます。";
    }
    return "";
  }

  static String _descriptionWeekDays(PlaceCsvModel data) {
    if (data.typeRegisterStamp == TypeRegisterStamp.gpsDate) {
      return '※ スタンプ押下可能時期は 平日 ${data.timeStartWeekDays} ~ ${data.timeEndWeekDays} です。';
    }
    return '';
  }

  static String _descriptionHoliday(PlaceCsvModel data) {
    if (data.typeRegisterStamp == TypeRegisterStamp.gpsDate) {
      return '※ スタンプ押下可能時期は 休日 ${data.timeStartHoliday} ~ ${data.timeEndHoliday} です。';
    }
    return '';
  }

  // CSVデータから型変換
  factory PlaceModel.fromAsset(
      {required PlaceCsvModel data, required List<DateTime> jpHoliday}) {
    return PlaceModel(
      historicSpotId: data.historicSpotId,
      name: data.name,
      areaName: data.areaName,
      yomigana: data.yomigana,
      longitude: data.longitude,
      latitude: data.latitude,
      typeRegisterStamp: data.typeRegisterStamp,
      url: data.url,
      worshipUrl: data.worshipUrl,
      gpsMeter: data.gpsMeter,
      img: data.img,
      proverbs: data.proverbs,
      worshipCardTopUrl: data.worship_card_top_image_url,
      dateStart: _getDateStart(data, jpHoliday),
      dateEnd: _getDateEnd(data, jpHoliday),
      descriptionGpsmeter: _descriptionGpsmeter(data),
      descriptionWeekDays: _descriptionWeekDays(data),
      descriptionHoliday: _descriptionHoliday(data),
    );
  }
}
