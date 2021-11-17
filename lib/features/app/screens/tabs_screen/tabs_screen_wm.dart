import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:ownfactory_flutter/features/app/screens/tabs_screen/tabs_screen.dart';
import 'package:ownfactory_flutter/utils/stub_model.dart';
import 'package:routemaster/routemaster.dart';

TabsScreenWM createTabsScreenWM(
  BuildContext context, {
  bool isAuth = false,
}) {
  return TabsScreenWM(isAuth: isAuth);
}

class TabsScreenWM extends WidgetModel<TabsScreen, StubModel> {
  final bool isAuth;
  final currentTabIndexState = StateNotifier<int>(initValue: 0);
  late final TabPageState tabPage;

  TabsScreenWM({this.isAuth = false}) : super(StubModel());

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    tabPage = TabPage.of(context);
    tabPage.controller.addListener(_tabIndexListener);
  }

  void onNavigationItemClick(int value) {
    tabPage.controller.animateTo(value);
  }

  void _tabIndexListener() {
    currentTabIndexState.accept(tabPage.controller.index);
  }
}
