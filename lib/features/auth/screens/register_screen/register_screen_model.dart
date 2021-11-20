import 'package:elementary/elementary.dart';
import 'package:ownfactory_flutter/features/auth/auth_interactor.dart';

class RegisterScreenModel extends ElementaryModel {
  final AuthInteractor _authInteractor;

  RegisterScreenModel(this._authInteractor);

  Future<void> doRegistration({
    required String email,
    required String password,
  }) async {
    try {
      await _authInteractor.registration(email: email, password: password);
      await _authInteractor.login(email: email, password: password);
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}
