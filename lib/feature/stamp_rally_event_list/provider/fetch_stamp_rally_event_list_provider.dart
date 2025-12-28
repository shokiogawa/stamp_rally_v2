import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/service/notion/notion_service.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_rally_event_list/model/stamp_rally_event.dart';

part 'fetch_stamp_rally_event_list_provider.g.dart';

@riverpod
Future<List<StampRallyEvent>> fetchStampRallyEventListProvider(Ref ref) async {
  final notionService = ref.read(notionServiceProvider);
  final notionModel = await notionService.fetchStampEventList();
  return notionModel.map((e) => StampRallyEvent.fromNotionModel(e)).toList();
}
