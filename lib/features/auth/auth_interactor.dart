import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/features/appwrite/appwrite_storage.dart';

@injectable
class AuthInteractor {
  final AppwriteStorage _storage;

  AuthInteractor(this._storage);

  Future<bool> isAuth() => _storage.isAuth();

  Future<void> login({
    required String email,
    required String password,
  }) =>
      _storage.login(email: email, password: password);

  Future<void> logout() => _storage.logout();
}
