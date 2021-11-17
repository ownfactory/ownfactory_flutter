import 'package:flutter/material.dart';
import 'package:ownfactory_flutter/features/app/screens/coming_soon/coming_soon_screen.dart';
import 'package:ownfactory_flutter/features/app/screens/init_screen/init_screen.dart';
import 'package:ownfactory_flutter/features/app/screens/login_screen/login_screen.dart';
import 'package:ownfactory_flutter/features/app/screens/tabs_screen/tabs_screen.dart';
import 'package:routemaster/routemaster.dart';

abstract class AppRoutes {
  static const root = '/';
  static const stub = '/stub';

  static const login = '/login';
  static const register = '/register';

  static const home = '/home';
  static const products = '/products';
  static const orders = '/orders';
  static const sales = '/sales';
  static const menu = '/menu';

  static const nonAuthTabs = [login, register];
  static const authTabs = [home, products, orders, sales, menu];

  static final initRoutesMap = RouteMap(
    routes: {
      AppRoutes.root: (_) => const MaterialPage<void>(child: InitScreen()),
    },
  );

  static final nonAuthRoutesMap = RouteMap(
    routes: {
      AppRoutes.root: (_) => TabPage(
            child: TabsScreen.nonAuth(key: UniqueKey()),
            paths: AppRoutes.nonAuthTabs,
          ),
      AppRoutes.login: (_) => const MaterialPage<void>(child: LoginScreen()),
      AppRoutes.register: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
    },
    onUnknownRoute: (_) => const Redirect(AppRoutes.root),
  );

  static final authRoutesMap = RouteMap(
    routes: {
      AppRoutes.root: (_) => TabPage(
            child: TabsScreen.auth(key: UniqueKey()),
            paths: AppRoutes.authTabs,
          ),
      AppRoutes.login: (_) => const Redirect(AppRoutes.root),
      AppRoutes.register: (_) => const Redirect(AppRoutes.root),
      AppRoutes.stub: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
      AppRoutes.home: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
      AppRoutes.products: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
      AppRoutes.orders: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
      AppRoutes.sales: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
      AppRoutes.menu: (_) => const MaterialPage<void>(child: ComingSoonScreen()),
    },
  );
}
