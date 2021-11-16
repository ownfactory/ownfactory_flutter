import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ownfactory_flutter/features/app/screens/tabs_screen/tabs_screen_wm.dart';
import 'package:ownfactory_flutter/ui/res/assets.dart';
import 'package:routemaster/routemaster.dart';

/// Main screen with tabs
class TabsScreen extends ElementaryWidget<TabsScreenWM> {
  TabsScreen({
    Key? key,
    bool isAuth = false,
  }) : super(
          (context) => createTabsScreenWM(context, isAuth: isAuth),
          key: key,
        );

  @override
  Widget build(TabsScreenWM wm) {
    return Scaffold(
      body: TabBarView(
        controller: wm.tabPage.controller,
        children: [
          for (final stack in wm.tabPage.stacks) PageStackNavigator(stack: stack),
        ],
      ),
      bottomNavigationBar: StateNotifierBuilder<int>(
        listenableState: wm.currentTabIndexState,
        builder: (context, currentIndex) {
          return BottomNavigationBar(
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
      BottomNavigationBarItem(label: 'Test1', icon: SvgPicture.asset(AssetsIcons.icLogin)),
      BottomNavigationBarItem(label: 'Test2', icon: SvgPicture.asset(AssetsIcons.icLogin)),
      BottomNavigationBarItem(label: 'Test3', icon: SvgPicture.asset(AssetsIcons.icLogin)),
      BottomNavigationBarItem(label: 'Test4', icon: SvgPicture.asset(AssetsIcons.icLogin)),
      BottomNavigationBarItem(label: 'Test5', icon: SvgPicture.asset(AssetsIcons.icLogin)),
    ];
  }

  List<BottomNavigationBarItem> _getNonAuthTabs() {
    return [
      BottomNavigationBarItem(
        label: 'Login',
        icon: SvgPicture.asset(AssetsIcons.icLogin),
      ),
      BottomNavigationBarItem(
        label: 'Register',
        icon: SvgPicture.asset(AssetsIcons.icRegistration),
      ),
    ];
  }
}
