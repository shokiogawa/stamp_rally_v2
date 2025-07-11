// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $startUpPageRoute,
    ];

RouteBase get $startUpPageRoute => GoRouteData.$route(
      path: '/',
      factory: $StartUpPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'main',
          name: 'main',
          factory: $MainScreenRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'main/stamp_detail',
              name: 'stamp_detail',
              factory: $StampDetailRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'login_sign_in',
          name: 'login_sign_in',
          factory: $LoginSignInPageRouteExtension._fromState,
        ),
      ],
    );

extension $StartUpPageRouteExtension on StartUpPageRoute {
  static StartUpPageRoute _fromState(GoRouterState state) =>
      const StartUpPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MainScreenRouteExtension on MainScreenRoute {
  static MainScreenRoute _fromState(GoRouterState state) =>
      const MainScreenRoute();

  String get location => GoRouteData.$location(
        '/main',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StampDetailRouteExtension on StampDetailRoute {
  static StampDetailRoute _fromState(GoRouterState state) => StampDetailRoute(
        state.uri.queryParameters['place-id']!,
      );

  String get location => GoRouteData.$location(
        '/main/main/stamp_detail',
        queryParams: {
          'place-id': placeId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginSignInPageRouteExtension on LoginSignInPageRoute {
  static LoginSignInPageRoute _fromState(GoRouterState state) =>
      const LoginSignInPageRoute();

  String get location => GoRouteData.$location(
        '/login_sign_in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'1f592e5459f484ca4dcbfbed8d584c3d2a565b60';

/// See also [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = AutoDisposeProvider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GoRouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
