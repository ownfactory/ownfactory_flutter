import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:ownfactory_flutter/config/env/env.dart';
import 'package:ownfactory_flutter/di/di_container.dart';
import 'package:ownfactory_flutter/domain/debug_options.dart';
import 'package:ownfactory_flutter/features/app/app.dart';
import 'package:ownfactory_flutter/features/app/screens/interactor/init_interactor.dart';
import 'package:ownfactory_flutter/features/auth/session_interactor.dart';
import 'package:ownfactory_flutter/utils/stub_model.dart';

enum AppAuthState {
  loading,
  nonAuth,
  auth,
}

const _splashDuration = Duration(seconds: 2);

class AppWM extends WidgetModel<App, StubModel> {
  /// debug option state
  final debugOptionsState = StateNotifier<DebugOptions>(initValue: getIt<Env>().debugOptions);

  final appAuthState = StateNotifier<AppAuthState>(initValue: AppAuthState.loading);

  final InitInteractor _initInteractor;
  final SessionInteractor _sessionInteractor;

  bool get _isAuth => _sessionInteractor.isAuthState.value ?? false;

  AppWM(
    this._initInteractor,
    this._sessionInteractor,
  ) : super(StubModel());

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    getIt<Env>().addListener(_envChangeListener);
    _loadApp();
  }

  @override
  void dispose() {
    getIt<Env>().removeListener(_envChangeListener);
    _sessionInteractor.isAuthState.removeListener(_authStateListener);
    super.dispose();
  }

  AppAuthState _authToInitState(bool isAuth) => isAuth ? AppAuthState.auth : AppAuthState.nonAuth;

  void _envChangeListener() => debugOptionsState.accept(getIt<Env>().debugOptions);

  Future<void> _loadApp() async {
    try {
      await Future.wait([
        _initInteractor.init(),
        Future<void>.delayed(_splashDuration),
      ]);
    } finally {
      appAuthState.accept(_authToInitState(_isAuth));
      _subscribeToSessionChanges();
    }
  }

  void _subscribeToSessionChanges() {
    _sessionInteractor.isAuthState.addListener(_authStateListener);
  }

  void _authStateListener() {
    appAuthState.accept(_authToInitState(_sessionInteractor.isAuthState.value ?? false));
  }
}

AppWM createAppWM(BuildContext context) {
  return AppWM(
    getIt<InitInteractor>(),
    getIt<SessionInteractor>(),
  );
}
