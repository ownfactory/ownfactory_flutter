import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/features/appwrite/appwrite_storage.dart';

@singleton
class InitInteractor {
  final AppwriteStorage _appwriteStorage;

  InitInteractor(this._appwriteStorage);

  Future<void> init() async {
    await _appwriteStorage.init();
  }
}
