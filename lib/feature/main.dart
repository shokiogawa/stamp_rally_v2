import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stamp_rally_v2_fvm/feature/google_map/google_map.dart';
import 'package:stamp_rally_v2_fvm/feature/home/home.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_list/stamp_list.dart';

import '../core/router/router.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

  // 詳細ページをスタック
  static void push(BuildContext context) {
    const MainScreenRoute().push(context);
  }

  // 全てをページを置き換え
  static void go(BuildContext context) {
    const MainScreenRoute().go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final pageList = [
      const HomePage(),
      const StampListPage(),
      const GoogleMapPage()
    ];
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: pageList[currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.summarize),
              label: '概要',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'スタンプラリー一覧',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'マップ',
            ),
          ],
          onTap: (index) {
            currentIndex.value = index;
          },
        ),
      ),
    );
  }
}
