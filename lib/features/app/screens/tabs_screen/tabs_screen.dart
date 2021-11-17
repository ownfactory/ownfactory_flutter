import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ownfactory_flutter/features/app/screens/tabs_screen/tabs_screen_wm.dart';
import 'package:ownfactory_flutter/ui/res/assets.dart';
import 'package:routemaster/routemaster.dart';

/// Main screen with tabs
class TabsScreen extends ElementaryWidget<TabsScreenWM> {
  TabsScreen._({Key? key, bool isAuth = false})
      : super((context) => createTabsScreenWM(context, isAuth: isAuth), key: key);

  factory TabsScreen.auth({Key? key}) => TabsScreen._(key: key, isAuth: true);

  factory TabsScreen.nonAuth({Key? key}) => TabsScreen._(key: key);

  @override
  Widget build(TabsScreenWM wm) {
    return Scaffold(
      body: TabBarView(
        controller: wm.tabPage.controller,
        children: [
          for (final stack in wm.tabPage.stacks)
            AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark,
              child: PageStackNavigator(stack: stack),
            ),
        ],
      ),
      bottomNavigationBar: StateNotifierBuilder<int>(
        listenableState: wm.currentTabIndexState,
        builder: (context, currentIndex) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.indigo.shade100,
            currentIndex: currentIndex ?? 0,
            items: wm.isAuth ? _getAuthTabs() : _getNonAuthTabs(),
            onTap: wm.onNavigationItemClick,
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getAuthTabs() {
    return [
      _getBNBItem('Home', AssetsIcons.icHome),
      _getBNBItem('Products', AssetsIcons.icProducts),
      _getBNBItem('Orders', AssetsIcons.icOrders),
      _getBNBItem('Sales', AssetsIcons.icSales),
      _getBNBItem('Menu', AssetsIcons.icMenu),
    ];
  }

  List<BottomNavigationBarItem> _getNonAuthTabs() {
    return [
      _getBNBItem('Login', AssetsIcons.icLogin),
      _getBNBItem('Register', AssetsIcons.icRegistration),
    ];
  }

  BottomNavigationBarItem _getBNBItem(String label, String assetName) {
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        assetName,
        color: Colors.indigo.shade100,
      ),
      activeIcon: SvgPicture.asset(
        assetName,
        color: Colors.indigo,
      ),
    );
  }
}
