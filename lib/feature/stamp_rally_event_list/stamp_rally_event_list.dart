import 'package:flutter/material.dart';

class StampRallyEventListPage extends StatelessWidget {
  const StampRallyEventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 仮のイベントデータ
    final events = [
      {
        'image': 'assets/images/oshiyama.jpg',
        'name': 'おしやまスタンプラリー',
        'period': '2024年7月1日 〜 2024年8月31日',
        'place': 'おしやま地域全域',
      },
      {
        'image': 'assets/images/oshiyama.jpg',
        'name': 'サンプルイベント',
        'period': '2024年9月1日 〜 2024年9月30日',
        'place': 'サンプル市',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('スタンプラリーイベント一覧'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      event['image'] as String,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            event['name'] as String,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const SizedBox(height: 8),
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
          );
        },
      ),
    );
  }
}
