import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';
import 'package:ownfactory_flutter/config/env/env.dart';

@singleton
class AppwriteStorage with NetworkLoggy {
  final Env _env;

  late final Client _client;
  late final Account _account;
  late final Database _database;

  AppwriteStorage(this._env);

  Future<void> init() async {
    _client = Client()
      ..setEndpoint(_env.endpoint)
      ..setProject(_env.projectId);
    _account = Account(_client);
    _database = Database(_client);
  }

  Future<bool> isAuth() async {
    try {
      await _account.get();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<Session> login({
    required String email,
    required String password,
  }) async {
    final response = await _account.createSession(
      email: email,
      password: password,
    );
    loggy.debug(response.toString());
    return response;
  }

  Future<void> logout() async {
    await _account.deleteSession(sessionId: 'current');
  }

  Future<User> registration({
    required String email,
    required String password,
  }) async {
    final response = await _account.create(
      name: email,
      email: email,
      password: password,
    );
    loggy.debug(response.toString());
    return response;
  }
}
