import 'dart:io';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/data/place/place_model.dart';
import 'package:stamp_rally_v2_fvm/core/service/download_image.service.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_detail/validation/can_get_stamp_worship_card.validation.dart';

part 'worship_card_file_notifier.g.dart';

// 取得済参拝カード画像一覧の状態管理

@riverpod
class WorshipCardFilesNotifier extends _$WorshipCardFilesNotifier {
  // スタンプ取得可能かバリデーション
  CanGetStampWorshipCardValidation get canGetStampWorshipCardValidation =>
      ref.read(canGetStampWorshipCardValidationProvider);
  @override
  FutureOr<List<File>> build(String historicSpotId) async {
    return fetchFiles(historicSpotId);
  }

  // 参拝カードの画像を取得
  Future<List<File>> fetchFiles(String historicSpotId) async {
    return await DownloadService.getFiles(historicSpotId);
  }

  // 参拝カードの画像を登録
  Future<void> registerWorshipCard(
      Uint8List imageBytes, PlaceModel place) async {
    await canGetStampWorshipCardValidation.execute(place);
    await DownloadService.saveImage(imageBytes, historicSpotId);

    // 画像を保存した後に再度ファイルを取得して更新
    final files = await fetchFiles(historicSpotId);
    state = AsyncValue.data(files);
  }

  // 参拝カード取得可能確認
  Future<void> checkCanGet(PlaceModel place) async {
    await canGetStampWorshipCardValidation.execute(place);
  }
}
