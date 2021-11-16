import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/features/appwrite/appwrite_storage.dart';
import 'package:ownfactory_flutter/features/auth/session_interactor.dart';

@injectable
class AuthInteractor {
  final AppwriteStorage _storage;
  final SessionInteractor _sessionInteractor;

  AuthInteractor(
    this._storage,
    this._sessionInteractor,
  );

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _storage.login(email: email, password: password);
    _sessionInteractor.notifyStartSession();
  }

  Future<void> logout() async {
    _sessionInteractor.notifyEndSession();
    await _storage.logout();
  }
}
