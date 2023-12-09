// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:test_app/core/navigation/app_routes.dart';
import 'package:test_app/core/widgets/wrapper_page.dart';
import 'package:test_app/features/favorites/favorites_page.dart';
import 'package:test_app/features/login/login_page.dart';
import 'package:test_app/features/map/map_page.dart';
import 'package:test_app/features/news/news_page.dart';
import 'package:test_app/features/profile/profile_page.dart';

// Project imports:

class NavigationKeyProvider {
  static GlobalKey<NavigatorState> get root => _root;

  static GlobalKey<NavigatorState> get main => _main;
  static GlobalKey<NavigatorState> get home => _home;

  static GlobalKey<NavigatorState> get news => _news;
  static GlobalKey<NavigatorState> get map => _map;
  static GlobalKey<NavigatorState> get favorites => _favorites;
  static GlobalKey<NavigatorState> get profile => _profile;

  static final GlobalKey<NavigatorState> _root = GlobalKey(debugLabel: 'root');

  static final GlobalKey<NavigatorState> _main = GlobalKey(debugLabel: 'main');
  static final GlobalKey<NavigatorState> _home = GlobalKey(debugLabel: 'home');

  static final GlobalKey<NavigatorState> _news = GlobalKey(debugLabel: 'news');
  static final GlobalKey<NavigatorState> _map = GlobalKey(debugLabel: 'map');
  static final GlobalKey<NavigatorState> _favorites = GlobalKey(debugLabel: 'favorites');
  static final GlobalKey<NavigatorState> _profile = GlobalKey(debugLabel: 'profile');
}

class NavigationService {
  NavigationService() {
    _goRouter = _config();
  }

  GoRouter get router => _goRouter;
  late GoRouter _goRouter;

  GoRouter _config() => GoRouter(
        navigatorKey: NavigationKeyProvider.root,
        initialLocation: AppRoutes.login.path,
        debugLogDiagnostics: true,
        routes: [
          _auth(),
          _home(),
        ],
        errorBuilder: (_, __) => const SizedBox.shrink(), // ToDo 666 Добавить страницу-заглушку для несуществующих
      );

  GoRoute _auth() {
    return GoRoute(
      name: AppRoutes.login.name,
      path: AppRoutes.login.path,
      builder: (context, state) => const WrapperPage(child: LoginPage()),
    );
  }

  ShellRoute _home() {
    return ShellRoute(
      navigatorKey: NavigationKeyProvider.home,
      builder: (_, __, child) => child,
      routes: [
        ShellRoute(
          navigatorKey: NavigationKeyProvider.favorites,
          pageBuilder: (_, __, child) => NoTransitionPage(child: child),
          builder: (_, __, child) => WrapperPage(child: child),
          routes: [
            GoRoute(
              name: AppRoutes.news.name,
              path: AppRoutes.news.path,
              builder: (_, __) => const NewsPage(),
            ),
            GoRoute(
              name: AppRoutes.map.name,
              path: AppRoutes.map.path,
              builder: (_, __) => const MapPage(),
            ),
            GoRoute(
              name: AppRoutes.favorites.name,
              path: AppRoutes.favorites.path,
              builder: (_, __) => const FavoritesPage(),
            ),
            GoRoute(
              name: AppRoutes.profile.name,
              path: AppRoutes.profile.path,
              builder: (_, __) => const ProfilePage(),
            ),
          ],
        ),
      ],
    );
  }
}

extension NavigationExtensions on BuildContext {
  void go(String path, {Object? extra}) => mounted ? GoRouter.of(this).go(path, extra: extra) : null;

  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Object? extra,
  }) =>
      mounted ? GoRouter.of(this).goNamed(name, pathParameters: pathParameters, extra: extra) : null;

  void push(String name, {Object? extra}) => mounted ? GoRouter.of(this).push(name, extra: extra) : null;

  void pushNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Object? extra,
  }) =>
      mounted ? GoRouter.of(this).pushNamed(name, pathParameters: pathParameters, extra: extra) : null;

  void pushReplacementNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Object? extra,
  }) =>
      mounted ? GoRouter.of(this).pushReplacementNamed(name, pathParameters: pathParameters, extra: extra) : null;

  void replaceNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Object? extra,
  }) =>
      mounted ? GoRouter.of(this).replaceNamed(name, pathParameters: pathParameters, extra: extra) : null;

  void pushAndRemoveUntil(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Object? extra,
  }) {
    while (mounted && GoRouter.of(this).canPop()) {
      GoRouter.of(this).pop();
    }

    if (mounted) {
      GoRouter.of(this).pushNamed(name, pathParameters: pathParameters, extra: extra);
    }
  }

  void pop() => mounted && GoRouter.of(this).canPop() ? GoRouter.of(this).pop() : null;
}
