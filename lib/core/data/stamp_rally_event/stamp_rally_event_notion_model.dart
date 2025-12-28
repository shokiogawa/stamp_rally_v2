import 'package:freezed_annotation/freezed_annotation.dart';

part 'stamp_rally_event_notion_model.freezed.dart';

part 'stamp_rally_event_notion_model.g.dart';

@freezed
class StampRallyEventNotionModel with _$StampRallyEventNotionModel {
  const factory StampRallyEventNotionModel({
    String? id,
    String? code,
    String? title,
    String? position,
    String? url,
    String? image,
    String? period,
  }) = _StampRallyEventNotionModel;

  const StampRallyEventNotionModel._();

  static T? extractNotionContent<T>(Map<String, dynamic> property) {
    final richText = property['rich_text'] as List?;
    if (richText != null && richText.isNotEmpty && richText.first != null) {
      final firstItem = richText.first as Map<String, dynamic>;
      final content = firstItem['text']?['content'] as T?;
      return content;
    }
    return null;
  }

  // notionデータベースからデータを取得
  factory StampRallyEventNotionModel.fromNotionJson(Map<String, dynamic> json) {
    return StampRallyEventNotionModel(
      id: extractNotionContent<String>(json['id']),
      code: extractNotionContent<String>(json['code']),
      title: extractNotionContent<String>(json['title']),
      position: extractNotionContent<String>(json['position']),
      image: extractNotionContent<String>(json['image']),
      period: extractNotionContent<String>(json['period']),
      url: extractNotionContent<String>(json['url']),
    );
  }

  // データをjson化
  factory StampRallyEventNotionModel.fromJson(Map<String, dynamic> json) =>
      _$StampRallyEventNotionModelFromJson(json);
}
