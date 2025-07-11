import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stamp_rally_v2_fvm/feature/login/pages/login_signin_page.dart';
import 'package:stamp_rally_v2_fvm/feature/main.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_detail/stamp_detail.dart';
import 'package:stamp_rally_v2_fvm/feature/startup/pages/start_up_page.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: [...$appRoutes],
  );
}

@TypedGoRoute<StartUpPageRoute>(
  path: '/',
  routes: [
    // ログイン & サインイン
    TypedGoRoute<MainScreenRoute>(path: 'main', name: 'main', routes: [
      TypedGoRoute<StampDetailRoute>(
        path: 'main/stamp_detail',
        name: 'stamp_detail',
      )
    ]),

    // ログイン & サインイン
    TypedGoRoute<LoginSignInPageRoute>(
      path: 'login_sign_in',
      name: 'login_sign_in',
    ),
  ],
)
// https://techblog.glpgs.com/entry/2023/05/11/150306

// スタートアップページ
class StartUpPageRoute extends GoRouteData {
  const StartUpPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StartUpPage();
}

class MainScreenRoute extends GoRouteData {
  const MainScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MainScreen();
}

class StampDetailRoute extends GoRouteData {
  const StampDetailRoute(this.placeId);

  final String placeId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      StampDetailScreen(placeId: placeId);
}

// ログイン & サインイン
class LoginSignInPageRoute extends GoRouteData {
  const LoginSignInPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginSignInPage();
}
