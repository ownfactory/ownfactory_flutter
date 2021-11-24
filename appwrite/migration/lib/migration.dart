import 'dart:convert';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:migration/domain/file_list.dart';
import 'package:migration/domain/migration_metadata.dart';

const metadataFileName = 'metadata.json';

class Migration {
  final Client _client;
  late final Storage _storage;

  Migration({
    required String projectId,
    required String apiEndpoint,
    required String secretApiKey,
  }) : _client = Client()
          ..setProject(projectId)
          ..setEndpoint(apiEndpoint)
          ..setKey(secretApiKey) {
    _storage = Storage(_client);
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
    return FileList.fromJson(response.data);
  }

  Future<MigrationMetadata?> _downloadMetadata({required String fileId}) async {
    final response = await _storage.getFileDownload(fileId: fileId);
    if (response.data is Map) {
      return MigrationMetadata.fromJson(response.data);
    }
    if (response.data is Uint8List) {
      return MigrationMetadata.fromJson(jsonDecode(String.fromCharCodes(response.data)));
    }
    throw Exception('Unknown $metadataFileName format');
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
}
