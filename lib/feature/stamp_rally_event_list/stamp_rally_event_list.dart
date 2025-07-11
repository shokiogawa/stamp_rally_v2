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
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                        Text(
                          event['name'] as String,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16, color: Colors.blueGrey),
                            const SizedBox(width: 4),
                            Text(
                              event['period'] as String,
                              style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.place, size: 16, color: Colors.redAccent),
                            const SizedBox(width: 4),
                            Text(
                              event['place'] as String,
                              style: const TextStyle(fontSize: 14, color: Colors.black87),
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


