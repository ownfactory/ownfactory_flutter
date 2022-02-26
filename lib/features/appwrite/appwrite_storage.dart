import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';
import 'package:ownfactory_flutter/config/env/env.dart';
import 'package:ownfactory_flutter/features/appwrite/dto/migration_metadata.dart';

const _metadataFileName = 'metadata.json';

@singleton
class AppwriteStorage with NetworkLoggy {
  final Env _env;

  late final Client _client;
  late final Account _account;
  late final Storage _storage;
  late final Database _database;

  late final MigrationMetadata? _metadata;

  MigrationMetadata get metadata => _metadata!;

  Storage get storage => _storage;

  Database get database => _database;

  AppwriteStorage(this._env);

  Future<void> init() async {
    _client = Client()
      ..setEndpoint(_env.endpoint)
      ..setProject(_env.projectId);
    _account = Account(_client);
    _storage = Storage(_client);
    _database = Database(_client);
    _metadata = await _getMetadata();
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
      userId: 'unique()',
      name: email,
      email: email,
      password: password,
    );
    loggy.debug(response.toString());
    return response;
  }

  Future<MigrationMetadata?> _getMetadata() async {
    final fileList = await _storage.listFiles(search: _metadataFileName);
    final metadataFile = fileList.files.firstWhereOrNull((e) => e.name == _metadataFileName);
    if (metadataFile == null) {
      loggy.warning('$_metadataFileName not found');
      return null;
    }
    final metadata = await _downloadMetadata(fileId: metadataFile.$id);
    return metadata;
  }

  Future<MigrationMetadata?> _downloadMetadata({required String fileId}) async {
    final response = await _storage.getFileDownload(fileId: fileId);
    final str = String.fromCharCodes(response);
    return MigrationMetadata.fromJson(jsonDecode(str) as Map<String, dynamic>);
  }
}
