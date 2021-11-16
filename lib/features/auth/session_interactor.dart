import 'package:elementary/elementary.dart';
import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/features/appwrite/appwrite_storage.dart';

@singleton
class SessionInteractor {
  final isAuthState = StateNotifier<bool>(initValue: false);

  final AppwriteStorage _storage;

  SessionInteractor(this._storage);

  Future<void> init() async {
    final isAuth = await _storage.isAuth();
    isAuthState.accept(isAuth);
  }

  void notifyStartSession() {
    isAuthState.accept(true);
  }

  void notifyEndSession() {
    isAuthState.accept(false);
  }
}
