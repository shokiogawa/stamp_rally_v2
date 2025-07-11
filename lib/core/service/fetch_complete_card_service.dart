import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/data/complete_card/complete_card_model.dart';
import 'package:stamp_rally_v2_fvm/core/service/csv.service.dart';

part 'fetch_complete_card_service.g.dart';

@riverpod
FetchCompleteCardService fetchCompleteCardService(Ref ref) {
  final csvService = ref.read(csvServiceProvider);
  return FetchCompleteCardService(csvService);
}

class FetchCompleteCardService {
  final CsvService csvService;
  FetchCompleteCardService(this.csvService);

  Future<CompleteCardModel?> execute() async {
    const url = 'https://jinja-net.jp/stamp-nexco01/data/complete_card.csv';
    final json = await csvService.convertCsvToJson(url: url);
    if (json == null) {
      return null;
    }

    final dataList = json.map((o) => CompleteCardModel.fromJson(o)).toList();
    return dataList[0];
  }
}
