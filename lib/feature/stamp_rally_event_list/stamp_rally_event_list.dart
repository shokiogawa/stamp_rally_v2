import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stamp_rally_v2_fvm/core/provider/selected_event_url_provider.dart';
import 'package:stamp_rally_v2_fvm/core/router/router.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_list/stamp_list.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_rally_event_detail/stamp_rally_event_detail.dart';

class StampRallyEventListPage extends HookConsumerWidget {
  // 詳細ページをスタック
  static void push(BuildContext context) {
    const StampRallyEventListPageRoute().push(context);
  }

  // 全てをページを置き換え
  static void go(BuildContext context) {
    const StampRallyEventListPageRoute().go(context);
  }

  const StampRallyEventListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 仮のイベントデータ
    final events = [
      // {
      //   'image': 'https://jinja-net.jp/stamp-takeru/image/TOP.png',
      //   'name': 'ヤマトタケルスタンプラリー',
      //   'period': '2024年7月1日 〜 2024年8月31日',
      //   'place': 'ヤマトタケル',
      //   'url': 'https://jinja-net.jp/stamp-takeru/data/takeru.csv'
      // },
      // {
      //   'image': 'https://jinja-net.jp/stamp-asahi1/image/TOP.png',
      //   'name': '朝日神社と兼務社めぐり',
      //   'period': '2024年9月1日 〜 2024年9月30日',
      //   'place': '朝日',
      //   'url': 'https://jinja-net.jp/stamp-asahi1/data/asahi1.csv'
      // },
      {
        'image': 'https://jinja-net.jp/stamp-asahi2/image/TOP.png',
        'name': '朝日神社年間祭祀',
        'period': '2024年9月1日 〜 2024年9月30日',
        'place': '朝日',
        'url': 'https://jinja-net.jp/stamp-asahi2/data/asahi2.csv'
      },
      {
        'image': 'https://jinja-net.jp/stamp-asahi3/image/TOP.png',
        'name': '朝日神社年間祭祀 複数年度対応版',
        'period': '2024年9月1日 〜 2024年9月30日',
        'place': '朝日',
        'url': 'https://jinja-net.jp/stamp-asahi3/data/asahi3.csv'
      },
      {
        'image': 'https://jinja-net.jp/stamp-jinguu1/image/TOP.png',
        'name': '伊勢神宮125社巡り',
        'period': '2024年9月1日 〜 2024年9月30日',
        'place': '伊勢',
        'url': 'https://jinja-net.jp/stamp-jinguu1/data/jinguu1.csv'
      },
      {
        'image': 'https://jinja-net.jp/stamp-jinguu7/image/TOP.png',
        'name': '伊勢神宮125社巡り 内宮編',
        'period': '2024年9月1日 〜 2024年9月30日',
        'place': '伊勢',
        'url': 'https://jinja-net.jp/stamp-jinguu7/data/jinguu7.csv',
      },
      {
        'image': 'https://jinja-net.jp/stamp-jinguu8/image/TOP.png',
        'name': '伊勢神宮125社巡り 二見編',
        'period': '2024年9月1日 〜 2024年9月30日',
        'place': '伊勢',
        'url': 'https://jinja-net.jp/stamp-jinguu8/data/jinguu8.csv',
      },
      {
        'image': 'https://jinja-net.jp/stamp-meitetu1/image/TOP.png',
        'name': '名鉄特急で行く 古後巡訪スタンプラリー',
        'period': '2024年9月1日 〜 2024年9月30日',
        'place': '名鉄',
        'url': 'https://jinja-net.jp/stamp-meitetu1/data/meitetu1.csv',
      },
      {
        'image': 'https://jinja-net.jp/stamp-nexco01/image/TOP.png',
        'name': 'Nexco',
        'period': '2024年9月1日 〜 2024年9月30日',
        'place': 'Nexco中日本',
        'url': 'https://jinja-net.jp/stamp-nexco01/data/nexco-01.csv',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("イベント一覧"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  final url = event['url']!;
                  // StampListPage.push(context, event['url']!);
                  StampRallyEventDetailPage.push(context, url);
                  ref
                      .watch(selectedEventUrlProvider.notifier)
                      .setUrl(event['url']!);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            event['image'] as String,
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event['name']!,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    size: 16, color: Colors.blueGrey),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    event['period'] as String,
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.blueGrey),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.place,
                                    size: 16, color: Colors.redAccent),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    event['place'] as String,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black87),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider()
            ],
          );
        },
      ),
    );
  }
}
