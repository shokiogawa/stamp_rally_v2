import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stamp_rally_v2_fvm/core/provider/selected_event_url_provider.dart';
import 'package:stamp_rally_v2_fvm/core/router/router.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_rally_event_detail/stamp_rally_event_detail.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_rally_event_list/provider/fetch_stamp_rally_event_list_provider.dart';

class StampRallyEventListPage extends HookConsumerWidget {
  // 詳細ページをスタック
  static void push(BuildContext context) {
    const StampRallyEventListPageRoute().push(context);
  }

  // 全てをページを置き換え
  static void go(BuildContext context) {
    const StampRallyEventListPageRoute().go(context);
  }

  static void pushReplacement(BuildContext context) {
    const StampRallyEventListPageRoute().pushReplacement(context);
  }

  const StampRallyEventListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(fetchStampRallyEventListProviderProvider);

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text("イベント一覧"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("スタンプラリーアプリ")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('ホーム'),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('イベント一覧'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('設定'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('アプリについて'),
            ),
          ],
        ),
      ),
      body: eventsAsync.when(
        data: (events) => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            final isJoined = event.isJoined ?? false;
            final url = event.url ?? '';
            final isCompleted = event.isCompleted ?? false;

            return GestureDetector(
              onTap: () {
                if (url.isNotEmpty) {
                  StampRallyEventDetailPage.push(context, url);
                  ref.watch(selectedEventUrlProvider.notifier).setUrl(url);
                }
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: event.image != null
                                    ? Image.network(
                                        event.image!,
                                        width: 110,
                                        height: 110,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              color: Colors.grey,
                                            ),
                                          );
                                        },
                                      )
                                    : const SizedBox(
                                        width: 110,
                                        height: 110,
                                      ),
                              ),
                              // 参加状況タグ
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isJoined ? Colors.green : Colors.orange,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    isJoined ? '参加中' : '未参加',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      event.title ?? '',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  // 達成状況
                                  if (isCompleted) _buildAchievementTag(url)
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today,
                                      size: 16, color: Colors.blueGrey),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      event.period ?? '期間未定',
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.blueGrey),
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              if (event.position != null) ...[
                                Row(
                                  children: [
                                    const Icon(Icons.pin_drop,
                                        size: 16, color: Colors.orange),
                                    const SizedBox(width: 4),
                                    Flexible(
                                      child: Text(
                                        event.position!,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black87),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
            );
          },
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'エラーが発生しました',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 達成タグを表示するウィジェット
  Widget _buildAchievementTag(String url) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.emoji_events,
            color: Colors.white,
            size: 12,
          ),
          SizedBox(width: 4),
          Text(
            '達成',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
