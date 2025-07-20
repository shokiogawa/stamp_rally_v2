import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stamp_rally_v2_fvm/core/data/stamp_rally_event/stamp_rally_event_notion_model.dart';

part 'stamp_rally_event.freezed.dart';

part 'stamp_rally_event.g.dart';

@freezed
class StampRallyEvent with _$StampRallyEvent {
  const factory StampRallyEvent(
      {String? id,
      String? code,
      String? title,
      String? position,
      String? url,
      String? image,
      String? period,
      bool? isJoined,
      bool? isCompleted}) = _StampRallyEvent;

  const StampRallyEvent._();

  static T? extractNotionContent<T>(Map<String, dynamic> property) {
    final richText = property['rich_text'] as List?;
    if (richText != null && richText.isNotEmpty && richText.first != null) {
      final firstItem = richText.first as Map<String, dynamic>;
      final content = firstItem['text']?['content'] as T?;
      return content;
    }
    return null;
  }

  factory StampRallyEvent.fromNotionJson(Map<String, dynamic> json) {
    return StampRallyEvent(
      id: extractNotionContent<String>(json['id']),
      code: extractNotionContent<String>(json['code']),
      title: extractNotionContent<String>(json['title']),
      position: extractNotionContent<String>(json['position']),
      image: extractNotionContent<String>(json['image']),
      period: extractNotionContent<String>(json['period']),
      url: extractNotionContent<String>(json['url']),
    );
  }

  factory StampRallyEvent.fromNotionModel(StampRallyEventNotionModel model) {
    return StampRallyEvent(
        id: model.id,
        code: model.code,
        title: model.title,
        position: model.position,
        image: model.image,
        period: model.period,
        url: model.url);
  }

  // データをjson化
  factory StampRallyEvent.fromJson(Map<String, dynamic> json) =>
      _$StampRallyEventFromJson(json);
}
