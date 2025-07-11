import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/data/place/place_model.dart';
import 'package:stamp_rally_v2_fvm/core/data/stamp/stamp_dto.dart';
import 'package:stamp_rally_v2_fvm/core/provider/fetch_place_provider.dart';
import 'package:stamp_rally_v2_fvm/core/utility/logger.dart';
import 'package:stamp_rally_v2_fvm/core/data/stamp/stamp_repository.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_detail/validation/can_get_stamp_worship_card.validation.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_list/provider/fetch_place_and_stamped_provider.dart';

part 'stamp_detail_notifier.g.dart';

@riverpod
class StampDetailNotifier extends _$StampDetailNotifier {
  final revalidateProviders = [
    fetchPlaceAndStampedProvider,
  ];
  // スタンプ取得可能かバリデーション
  CanGetStampWorshipCardValidation get canGetStampWorshipCardValidation =>
      ref.read(canGetStampWorshipCardValidationProvider);

  PlaceModel getPlaceModel(String id) {
    final place = ref.watch(fetchPlacesProvider).valueOrNull;
    if (place == null) {
      logger.e("スタンプ一覧データが存在しません");
      throw Exception("スタンプ一覧データが存在しません");
    }
    final placeData = place.firstWhere(
      (p) => p.historicSpotId == id,
      orElse: () => throw Exception("指定されたスポットが見つかりません"),
    );
    return placeData;
  }

  @override
  FutureOr<StampDto?> build(String historicSpotId) async {
    final data =
        await ref.read(stampRepositoryProvider).fetchDetail(historicSpotId);
    logger.i("Fetched stamp data: $data");

    // データが存在しない場合
    if (data == null) {
      final placeData = getPlaceModel(historicSpotId);
      return StampDto(
        historicSpotId: placeData.historicSpotId,
        placeName: placeData.name,
        stampedDateTimeList: [],
      );
    } else {
      return data;
    }
  }

  // スタンプ一覧取得
  Future<StampDto?> fetchDetail(String historicSpotId) async {
    final date =
        await ref.read(stampRepositoryProvider).fetchDetail(historicSpotId);
    logger.i("Fetched stamp detail: $date");
    return date;
  }

  // スタンプ登録
  Future<void> registerStamp() async {
    final stampDto = await future;
    if (stampDto == null) {
      throw Exception("スタンプデータが存在しません");
    }

    // バリデーション実行
    final place = getPlaceModel(stampDto.historicSpotId);
    await canGetStampWorshipCardValidation.execute(place);

    final updateStamp = stampDto.registerStamp();
    await ref.read(stampRepositoryProvider).register(updateStamp);
    logger.i("スタンプ取得: $updateStamp");
    state = AsyncValue.data(await fetchDetail(stampDto.historicSpotId));

    // スタンプ取得後に再検証
    revlidate();
  }

  // 影響providerを更新
  void revlidate() {
    for (var provider in revalidateProviders) {
      ref.invalidate(provider);
    }
  }
}
