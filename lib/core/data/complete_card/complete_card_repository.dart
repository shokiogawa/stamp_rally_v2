import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/data/complete_card/complete_card_dto.dart';
import 'package:stamp_rally_v2_fvm/core/shared_preferences_provider.dart';

part 'complete_card_repository.g.dart';

@riverpod
CompleteCardRepository completeCardRepository(Ref ref) {
  return CompleteCardRepository(ref);
}

class CompleteCardRepository {
  final Ref ref;

  const CompleteCardRepository(this.ref);

  // 達成カード登録
  Future<void> register(CompleteCardDto dto) async {
    final pref = await ref.read(sharedPreferencesProvider.future);

    final data = json.encode(dto.toJson());

    await pref.setString(SharedPreferenceKeys.completeCard.name, data);
  }

  Future<bool> isExist() async {
    if ((await fetch()) != null) return true;
    return false;
  }

  // 達成カード取得
  Future<CompleteCardDto?> fetch() async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    final data = pref.getString(SharedPreferenceKeys.completeCard.name);

    // データが存在しない場合は、nullを返す。
    if (data == null) {
      return null;
    }

    return CompleteCardDto.fromJson(json.decode(data));
  }
}
