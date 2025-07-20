import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/data/place/place_csv_model.dart';
import 'package:stamp_rally_v2_fvm/core/data/place/place_model.dart';
import 'package:stamp_rally_v2_fvm/core/service/csv/csv.service.dart';
import 'package:stamp_rally_v2_fvm/core/service/get_holiday_jp.servce.dart';

part 'fetch_place_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<PlaceModel>> fetchPlaces(Ref ref) async {
  final csvService = ref.watch(csvServiceProvider);
  const url = 'https://jinja-net.jp/stamp-nexco01/data/nexco-01.csv';
  final json = await csvService.convertCsvToJson(url: url);
  if (json == null) {
    return [];
  }

  final jpHolidays = await ref.read(getHolidayJpServiceProvider).getHolidays();

  // データが存在しない場合は、削除
  json.removeWhere((element) => (element['historicSpotId'] as String).isEmpty);

  return json
      .map((o) => PlaceModel.fromAsset(
          data: PlaceCsvModel.fromJson(o), jpHoliday: jpHolidays))
      .toList();
}
