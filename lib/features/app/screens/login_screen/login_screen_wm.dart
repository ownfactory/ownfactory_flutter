import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ownfactory_flutter/di/di_container.dart';
import 'package:ownfactory_flutter/features/app/app_routes.dart';
import 'package:ownfactory_flutter/features/app/screens/login_screen/login_screen.dart';
import 'package:ownfactory_flutter/features/app/screens/login_screen/login_screen_model.dart';
import 'package:ownfactory_flutter/features/auth/auth_interactor.dart';
import 'package:routemaster/routemaster.dart';

class LoginScreenWM extends WidgetModel<LoginScreen, LoginScreenModel> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final loadingState = StateNotifier<bool>(initValue: false);

  LoginScreenWM(LoginScreenModel model) : super(model);

  void sendData() {
    final email = emailTextController.text;
    final password = passwordTextController.text;
    loadingState.accept(true);
    model
        .doLogin(email: email, password: password)
        // .then((_) => Routemaster.of(context).replace(AppRoutes.root))
        .whenComplete(() => loadingState.accept(false));
  }
}

LoginScreenWM createLoginScreenWM(BuildContext context) {
  return LoginScreenWM(
    LoginScreenModel(
      getIt<AuthInteractor>(),
    ),
  );
}
