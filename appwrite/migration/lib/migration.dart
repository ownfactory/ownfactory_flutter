import 'dart:convert';
import 'dart:io' as io;

import 'package:collection/collection.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:loggy/loggy.dart';
import 'package:migration/domain/migration_metadata.dart';

const metadataFileName = 'metadata.json';

typedef CreateCollectionCallback = void Function(Collection);

class Migration {
  final Client _client;
  late final Storage _storage;
  late final Database _database;

  final CreateCollectionCallback createCollectionCallback;

  Migration({
    required String projectId,
    required String apiEndpoint,
    required String secretApiKey,
    required this.createCollectionCallback,
  }) : _client = Client()
          ..setProject(projectId)
          ..setEndpoint(apiEndpoint)
          ..setKey(secretApiKey) {
    _storage = Storage(_client);
    _database = Database(_client);
  }

  Future<void> initMetadata(MigrationMetadata metadata) async {
    final content = jsonEncode(metadata.toJson());
    await _storage.createFile(
      file: MultipartFile.fromString(
        'file',
        content,
        filename: metadataFileName,
      ),
      read: ['role:member'],
      write: ['role:member'],
    );
  }

  Future<MigrationMetadata?> getMetadata() async {
    final fileList = await _listFiles(search: metadataFileName);
    final metadataFile = fileList.files.firstWhereOrNull((e) => e.name == metadataFileName);
    if (metadataFile == null) {
      return null;
    }
    final metadata = _downloadMetadata(fileId: metadataFile.$id);
    return metadata;
  }

  Future<FileList> _listFiles({String? search}) async {
    final response = await _storage.listFiles(search: search);
    return response;
  }

  Future<MigrationMetadata?> _downloadMetadata({required String fileId}) async {
    final response = await _storage.getFileDownload(fileId: fileId);
    return MigrationMetadata.fromJson(jsonDecode(String.fromCharCodes(response)));
  }

  Future<void> saveMetadata(MigrationMetadata metadata) async {
    final fileList = await _listFiles(search: metadataFileName);
    final metadataFile = fileList.files.firstWhereOrNull((e) => e.name == metadataFileName);
    if (metadataFile == null) {
      throw Exception('$metadataFileName not found');
    }

    // delete old file
    await _storage.deleteFile(fileId: metadataFile.$id);

    // create new file
    final content = jsonEncode(metadata.toJson());
    await _storage.createFile(
      file: MultipartFile.fromString(
        'file',
        content,
        filename: metadataFileName,
      ),
      read: ['role:member'],
      write: ['role:member'],
    );
  }

  Future<void> createCollection(String assetFileName) async {
    final file = io.File(assetFileName);
    final json = jsonDecode(await file.readAsString());
    final collection = Collection.fromMap(json);

    logInfo('Create collection: ${collection.name}');

    final response = await _database.createCollection(
      name: collection.name,
      read: collection.$permissions.read,
      write: collection.$permissions.write,
      rules: collection.rules,
    );
    createCollectionCallback(response);
  }
}
