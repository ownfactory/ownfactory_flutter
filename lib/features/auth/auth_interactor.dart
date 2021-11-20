import 'package:appwrite/models.dart';
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

  Future<Session> login({
    required String email,
    required String password,
  }) async {
    final result = await _storage.login(email: email, password: password);
    _sessionInteractor.notifyStartSession();
    return result;
  }

  Future<void> logout() async {
    _sessionInteractor.notifyEndSession();
    await _storage.logout();
  }

  Future<User> registration({
    required String email,
    required String password,
  }) async {
    final result = await _storage.registration(email: email, password: password);
    _sessionInteractor.notifyStartSession();
    return result;
  }
}
