import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stamp_rally_v2_fvm/core/component/loading_snack_bar.dart';
import 'package:stamp_rally_v2_fvm/core/data/place/place_csv_model.dart';
import 'package:stamp_rally_v2_fvm/core/data/place/place_model.dart';
import 'package:stamp_rally_v2_fvm/core/router/router.dart';
import 'package:stamp_rally_v2_fvm/core/utility/format_japanese_date.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_detail/provider/stamp_detail_notifier.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_detail/provider/worship_card_file_notifier.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_detail/qr_code_scanner.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_detail/widget/worship_card_dialog.dart';
import 'package:stamp_rally_v2_fvm/core/service/open_another_url_service.dart';

class StampDetailScreen extends HookConsumerWidget {
  const StampDetailScreen({super.key, required this.placeId});

  final String placeId;

  // 詳細ページをスタック
  static void push(BuildContext context, String placeId) {
    StampDetailRoute(placeId).push(context);
  }

  // 全てをページを置き換え
  static void go(BuildContext context, String placeId) {
    StampDetailRoute(placeId).go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 仮のデータ
    const image = 'assets/images/oshiyama.jpg';
    const description =
        'おしやま公園は自然豊かな公園で、家族連れや観光客に人気のスポットです。春には桜が咲き誇り、ピクニックにも最適です。';

    final asyncNotifier = ref.watch(stampDetailNotifierProvider(placeId));
    final notifier = ref.watch(stampDetailNotifierProvider(placeId).notifier);
    final place = notifier.getPlaceModel(placeId);

    final worshipCardNotifier = ref
        .watch(worshipCardFilesNotifierProvider(place.historicSpotId).notifier);

    return asyncNotifier.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(data?.placeName ?? ''),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      image,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color:
                            data != null && data.stampedDateTimeList.isNotEmpty
                                ? Colors.green
                                : Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        data?.placeName ?? '',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 3),
                      GestureDetector(
                        child: const Icon(
                          Icons.pin_drop,
                          size: 20,
                          color: Colors.brown,
                        ),
                        onTap: () async {
                          await OpenAnotherUrlService.openGoogleMap(
                            place.latitude.toString(),
                            place.longitude.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),

                  // スタンプ取得ボタン
                  ElevatedButton.icon(
                    onPressed: () async {
                      // QRコードが必要な場合はQRコード画面に遷移する。
                      if (place.typeRegisterStamp == TypeRegisterStamp.qr) {
                        QrCodeScannerScreen.push(context, placeId);
                      } else {
                        // それ以外は、QRコード以外のチェック
                        LoadingAction.showSnackBar(
                            future: () {
                              // スタンプ登録処理
                              return notifier.registerStamp();
                            },
                            context: context,
                            successMessage: "スタンプを取得しました。",
                            errorMessage: "",
                            showSuccessSnackBar: true);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007B43),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    icon: const Icon(Icons.verified, color: Colors.white),
                    label: const Text(
                      'スタンプを取得',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 参拝カード取得ボタン
                  ElevatedButton.icon(
                    onPressed: () async {
                      await LoadingAction.showSnackBar(
                          future: () async {
                            await worshipCardNotifier.checkCanGet(place);
                          },
                          context: context,
                          successMessage: "",
                          errorMessage: "",
                          showSuccessSnackBar: false,
                          onSucess: () async {
                            if (context.mounted) {
                              // 参拝カードダイアログを表示
                              showWorshipCardDialog(context, place);
                            }
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6F4E37),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    icon:
                        const Icon(Icons.card_membership, color: Colors.white),
                    label: const Text(
                      '参拝カードを取得',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // スタンプ押下説明
                  StampDetailDescription(place: place),
                  const SizedBox(height: 16),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: const Text(
                      'スタンプ履歴を表示',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.history, color: Colors.blue),
                    children:
                        data != null && data.stampedDateTimeList.isNotEmpty
                            ? data.stampedDateTimeList.map((historyDateTime) {
                                return Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/stamp.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          formatJapaneseDate(historyDateTime),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ));
                              }).toList()
                            : [
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'まだスタンプは取得されていません。',
                                  ),
                                )
                              ],
                  ),
                  // const SizedBox(height: 24),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: const Text(
                      '参拝カードを表示',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    leading:
                        const Icon(Icons.card_giftcard, color: Colors.brown),
                    children: [
                      WorshipCardImage(
                        historicSpotId: data?.historicSpotId ?? '',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('エラーが発生しました: $error')),
    );
  }
}

// 説明
class StampDetailDescription extends StatelessWidget {
  final PlaceModel place;

  const StampDetailDescription({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (place.typeRegisterStamp == TypeRegisterStamp.gps ||
            place.typeRegisterStamp == TypeRegisterStamp.gpsDate)
          Text(place.descriptionGpsmeter,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        if (place.typeRegisterStamp == TypeRegisterStamp.gpsDate &&
            place.descriptionWeekDays.isNotEmpty)
          Text(
            place.descriptionWeekDays,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        if (place.typeRegisterStamp == TypeRegisterStamp.gpsDate &&
            place.descriptionHoliday.isNotEmpty)
          Text(
            place.descriptionHoliday,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
      ],
    );
  }
}

// 参拝カードの画像を表示するウィジェット
class WorshipCardImage extends HookConsumerWidget {
  final String historicSpotId;

  const WorshipCardImage({super.key, required this.historicSpotId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileNotifier = ref.watch(
      worshipCardFilesNotifierProvider(historicSpotId),
    );
    return fileNotifier.when(
      data: (files) {
        if (files.isEmpty) {
          return const Center(
              child: Padding(
                  padding: EdgeInsets.all(16.0), child: Text('参拝カードはまだありません')));
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 10,
          ),
          itemCount: files.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Image.file(
                files[index],
                fit: BoxFit.scaleDown,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.zero,
                    child: InteractiveViewer(
                      panEnabled: true,
                      minScale: 1,
                      maxScale: 4,
                      child: Image.file(
                        files[index],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(child: Text('参拝カードはまだありません')),
    );
  }
}
