import 'package:elementary/elementary.dart';
import 'package:ownfactory_flutter/features/auth/auth_interactor.dart';

class LoginScreenModel extends ElementaryModel {
  final AuthInteractor _authInteractor;

  LoginScreenModel(this._authInteractor);

  Future<void> doLogin({
    required String email,
    required String password,
  }) async {
    try {
      await _authInteractor.login(email: email, password: password);
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}
