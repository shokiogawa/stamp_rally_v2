import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stamp_rally_v2_fvm/core/router/router.dart';
import 'package:stamp_rally_v2_fvm/core/usecase/auth/auth_use_case.dart';
import 'package:stamp_rally_v2_fvm/core/usecase/auth/check_login_status_use_case.dart';
import 'package:stamp_rally_v2_fvm/feature/main.dart';
import 'package:stamp_rally_v2_fvm/feature/startup/usecases/start_up_use_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/utility/logger.dart';

class StartUpPage extends HookConsumerWidget {
  const StartUpPage({super.key});

  static String get pageName => 'start_up';

  static String get pagePath => '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authUseCase = ref.watch(authUseCaseProvider.notifier);
    Future(() async {
      const MainScreenRoute().pushReplacement(context);
      // if (await authUseCase.isLogin()) {
      //   if (context.mounted) {
      //     const MainScreenRoute().pushReplacement(context);
      //     // const WorkspaceListPageRoute().pushReplacement(context);
      //   }
      // } else {
      //   if (context.mounted) {
      //     const MainScreenRoute().pushReplacement(context);
      //     // const LoginSignInPageRoute().pushReplacement(context);
      //   }
      // }
    });

    // ref
    //   ..watch(checkLoginStatusUseCaseProvider)
    //   ..listen(checkLoginStatusUseCaseProvider, (previous, next) async {
    //     switch (next) {
    //       case AsyncData(:final value):
    //         final state = await ref.watch(startUpUseCaseProvider.future);
    //         if (state == StartUpResultType.forceVersionUp) {
    //           // ダイアログ表示
    //           const WorkspaceListPageRoute().pushReplacement(context);
    //           return;
    //         }
    //         final session = value.session;
    //         logger.i(session);
    //
    //         // サインイン
    //         if (value.session != null) {
    //           if (context.mounted) {
    //             const WorkspaceListPageRoute().pushReplacement(context);
    //             return;
    //           }
    //         }
    //
    //         // ログイン or サインイン
    //         if (value.session == null) {
    //           if (context.mounted) {
    //             // const LoginSignInPageRoute().pushReplacement(context);
    //             const WorkspaceListPageRoute().pushReplacement(context);
    //             return;
    //           }
    //         }
    //
    //         // サインアウト
    //         if (value.event == AuthChangeEvent.signedOut) {
    //           // ログインページに遷移
    //           const WorkspaceListPageRoute().pushReplacement(context);
    //         }
    //         const WorkspaceListPageRoute().pushReplacement(context);
    //     }
    //   });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
              // alignment: Alignment.center,
              child: Text('最新のバージョンがリリースされています。')),
          TextButton(
              onPressed: () {
                // const WorkspaceListPageRoute().pushReplacement(context);
              },
              child: const Text('アプリストアへ遷移する。'))
        ],
      ),
    );
  }
}
