import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:ownfactory_flutter/di/di_container.dart';
import 'package:ownfactory_flutter/features/auth/auth_interactor.dart';
import 'package:ownfactory_flutter/features/auth/screens/login_screen/login_screen.dart';
import 'package:ownfactory_flutter/features/auth/screens/login_screen/login_screen_model.dart';

class LoginScreenWM extends WidgetModel<LoginScreen, LoginScreenModel> with UiLoggy {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final loadingState = StateNotifier<bool>(initValue: false);

  LoginScreenWM(LoginScreenModel model) : super(model);

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);
    loggy.error(error.toString());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('An error has occurred. Please try again later.'),
    ));
  }

  void sendData() {
    final email = emailTextController.text;
    final password = passwordTextController.text;
    loadingState.accept(true);
    model.doLogin(email: email, password: password).whenComplete(() => loadingState.accept(false));
  }
}

LoginScreenWM createLoginScreenWM(BuildContext context) {
  return LoginScreenWM(
    LoginScreenModel(
      getIt<AuthInteractor>(),
    ),
  );
}
