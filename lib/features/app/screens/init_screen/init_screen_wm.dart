import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ownfactory_flutter/di/di_container.dart';
import 'package:ownfactory_flutter/features/app/screens/coming_soon/coming_soon_screen.dart';
import 'package:ownfactory_flutter/features/app/screens/init_screen/init_screen.dart';
import 'package:ownfactory_flutter/features/app/screens/interactor/init_interactor.dart';
import 'package:ownfactory_flutter/features/auth/auth_interactor.dart';
import 'package:ownfactory_flutter/utils/stub_model.dart';

InitScreenWM createInitScreenWM(BuildContext context) {
  return InitScreenWM(
    getIt<GlobalKey<NavigatorState>>().currentState!,
    getIt<InitInteractor>(),
    getIt<AuthInteractor>(),
  );
}

const _splashDuration = Duration(seconds: 2);

class InitScreenWM extends WidgetModel<InitScreen, StubModel> {
  final NavigatorState _rootNavigator;
  final InitInteractor _initInteractor;
  final AuthInteractor _authInteractor;

  InitScreenWM(
    this._rootNavigator,
    this._initInteractor,
    this._authInteractor,
  ) : super(StubModel());

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadApp();
  }

  Future<void> _loadApp() async {
    try {
      await Future.wait([
        _initInteractor.init(),
        Future<void>.delayed(_splashDuration),
      ]);
    } finally {
      unawaited(_authInteractor.isAuth().then<bool>(_openNextScreen));
    }
  }

  FutureOr<bool> _openNextScreen(bool isAuth) {
    _openComingSoonScreen();
    return isAuth;
  }

  void _openComingSoonScreen() {
    _rootNavigator.pushReplacement(ComingSoonScreenRoute());
  }
}
