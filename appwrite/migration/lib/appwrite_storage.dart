import 'dart:async';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:migration/domain/file_list.dart';

class AppwriteStorage {
  final String projectId;
  final String apiEndpoint;
  final String secretApiKey;

  final Client _client;
  late Storage _storage;
  late Database _database;

  AppwriteStorage({
    required this.projectId,
    required this.apiEndpoint,
    required this.secretApiKey,
  }) : _client = Client()
          ..setEndpoint(apiEndpoint)
          ..setProject(projectId)
          ..setKey(secretApiKey) {
    _storage = Storage(_client);
    _database = Database(_client);
  }

  Future<FileList> listFiles({String? search}) async {
    final response = await _storage.listFiles(search: search);
    return FileList.fromJson(response.data);
  }
}
