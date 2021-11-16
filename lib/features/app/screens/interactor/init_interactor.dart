import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/features/appwrite/appwrite_storage.dart';
import 'package:ownfactory_flutter/features/auth/session_interactor.dart';

@singleton
class InitInteractor {
  final AppwriteStorage _appwriteStorage;
  final SessionInteractor _sessionInteractor;

  InitInteractor(
    this._appwriteStorage,
    this._sessionInteractor,
  );

  Future<void> init() async {
    await _appwriteStorage.init();
    await _sessionInteractor.init();
  }
}
