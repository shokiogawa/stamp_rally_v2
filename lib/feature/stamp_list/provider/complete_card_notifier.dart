import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/data/complete_card/complete_card_dto.dart';
import 'package:stamp_rally_v2_fvm/core/data/complete_card/complete_card_repository.dart';
import 'package:stamp_rally_v2_fvm/core/service/fetch_complete_card_service.dart';

part 'complete_card_notifier.g.dart';

@riverpod
class CompleteCardNotifier extends _$CompleteCardNotifier {
  final revalidateProviders = [];

  CompleteCardRepository get _completeCardRepository =>
      ref.read(completeCardRepositoryProvider);

  FetchCompleteCardService get _fetchCompleteCardService =>
      ref.read(fetchCompleteCardServiceProvider);

  @override
  FutureOr<CompleteCardDto?> build() async {
    return fetch();
  }

  // 取得
  Future<CompleteCardDto?> fetch() async {
    final isExist = await _completeCardRepository.isExist();

    // データが存在しない場合登録する
    if (!isExist) {
      await register();
    }
    return await _completeCardRepository.fetch();
  }

  // 登録
  Future<void> register() async {
    final targetData = await _fetchCompleteCardService.execute();
    if (targetData == null) {
      return;
    }
    final completeCard = CompleteCardDto.create(
        message: targetData.message,
        title: targetData.title,
        now: DateTime.now());

    await _completeCardRepository.register(completeCard);
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
