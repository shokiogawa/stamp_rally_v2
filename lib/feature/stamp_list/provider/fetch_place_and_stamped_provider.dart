import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/data/place/place_model.dart';
import 'package:stamp_rally_v2_fvm/core/data/stamp/stamp_repository.dart';
import 'package:stamp_rally_v2_fvm/core/provider/fetch_place_by_place_provider.dart';

part 'fetch_place_and_stamped_provider.g.dart';

@riverpod
Future<List<PlaceModel>> fetchPlaceAndStamped(Ref ref, String url) async {
  final placeList = await ref.watch(fetchPlaceByPlaceProvider(url).future);
  final stampList = await ref.read(stampRepositoryProvider).fetchList();

  return placeList.map((place) {
    final stampedData = stampList.firstWhereOrNull(
        (stamp) => stamp.historicSpotId == place.historicSpotId);
    final isStamped =
        stampedData != null && stampedData.stampedDateTimeList.isNotEmpty;
    return place.copyWith(isStamped: isStamped);
  }).toList();
}
