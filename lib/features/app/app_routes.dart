import 'package:flutter/material.dart';
import 'package:ownfactory_flutter/features/app/screens/coming_soon/coming_soon_screen.dart';
import 'package:ownfactory_flutter/features/app/screens/init_screen/init_screen.dart';
import 'package:ownfactory_flutter/features/app/screens/tabs_screen/tabs_screen.dart';
import 'package:routemaster/routemaster.dart';

abstract class AppRoutes {
  static const root = '/';
  static const authorized = '/authorized';
  static const nonAuthorized = '/nonAuthorized';
  static const comingSoon = '/comingSoon';

  static const login = '/login';
  static const register = '/register';

  static const nonAuthTabs = [login, register];
  static const authTabs = [comingSoon, comingSoon, comingSoon, comingSoon, comingSoon];

  static final initRoutesMap = RouteMap(
    routes: {
      AppRoutes.root: (_) => const MaterialPage<void>(child: InitScreen()),
    },
  );

  static final nonAuthRoutesMap = RouteMap(
    routes: {
      AppRoutes.root: (_) => TabPage(child: TabsScreen(), paths: AppRoutes.nonAuthTabs),
      AppRoutes.login: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
      AppRoutes.register: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
    },
  );

  static final authRoutesMap = RouteMap(
    routes: {
      AppRoutes.root: (_) => TabPage(child: TabsScreen(isAuth: true), paths: AppRoutes.authTabs),
      AppRoutes.comingSoon: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
    },
  );
}
