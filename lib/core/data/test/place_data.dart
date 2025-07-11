import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_data.freezed.dart';
part 'place_data.g.dart';

@freezed
class PlaceData with _$PlaceData {
  const factory PlaceData({
    required int id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
  }) = _PlaceData;

  const PlaceData._();

  // データをjson化
  factory PlaceData.fromJson(Map<String, dynamic> json) =>
      _$PlaceDataFromJson(json);

  // static String collectionPath(String userId) =>
  //     'sample/v1/developers/$userId/memos';
  // static CollectionReference<SnapType> colRef(String userId) =>
  //     Document.colRef(collectionPath(userId));
  //
  // static String docPath(String userId, String id) =>
  //     '${collectionPath(userId)}/$id';
  // static DocumentReference<SnapType> docRef(String userId, String id) =>
  //     Document.docRefWithDocPath(docPath(userId, id));
  //
  // Map<String, dynamic> get toCreateDoc => <String, dynamic>{
  //   'memoId': memoId,
  //   'text': text,
  //   'createdAt': FieldValue.serverTimestamp(),
  //   'updatedAt': FieldValue.serverTimestamp(),
  // };
  //
  // Map<String, dynamic> get toUpdateDoc => <String, dynamic>{
  //   'text': text,
  //   'updatedAt': FieldValue.serverTimestamp(),
  // };
  //
  // String get dateLabel {
  //   final date = createdAt;
  //   if (date == null) {
  //     return '-';
  //   }
  //   return date.format(pattern: 'yyyy.M.d HH:mm');
  // }
}
