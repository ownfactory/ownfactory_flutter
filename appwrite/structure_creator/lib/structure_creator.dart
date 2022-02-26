import 'dart:convert';
import 'dart:io' as io;

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:loggy/loggy.dart';

class StructureCreator {
  final String projectId;
  final String apiEndpoint;
  final String secretApiKey;

  final Client _client;
  late final Storage _storage;
  late final Database _database;

  StructureCreator({
    required this.projectId,
    required this.apiEndpoint,
    required this.secretApiKey,
  }) : _client = Client()
          ..setProject(projectId)
          ..setEndpoint(apiEndpoint)
          ..setKey(secretApiKey) {
    _storage = Storage(_client);
    _database = Database(_client);
  }

  Future<void> run() async {
    await _clearOldStructure();

    await _createCollections();
  }

  Future<void> _clearOldStructure() async {
    await _clearCollections();
  }

  Future<void> _clearCollections() async {
    final collectionList = await _database.listCollections();

    if (collectionList.sum == 0) return;
    for (final item in collectionList.collections) {
      logInfo('Delete old collection: ${item.name}');
      await _database.deleteCollection(collectionId: item.$id);
    }
  }

  Future<void> _createCollections() async {
    await _createCollection('./assets/collections/products.json');
  }

  Future<void> _createCollection(String assetName) async {
    final file = io.File(assetName);
    final json = jsonDecode(await file.readAsString());
    final collection = Collection.fromMap(json);

    logInfo('Create collection: ${collection.name}');

    await _database.createCollection(
      collectionId: collection.$id,
      name: collection.name,
      read: collection.$read,
      write: collection.$write,
      permission: collection.permission,
    );

    for (final item in collection.attributes) {
      await _createCollectionAttribute(collection.$id, item);
    }
  }

  Future<void> _createCollectionAttribute(
    String collectionId,
    Map<String, dynamic> item,
  ) async {
    final type = item['type'];
    if (type == null) return;
    switch (type) {
      case 'string':
        final attr = AttributeString.fromMap(item);
        await _database.createStringAttribute(
          collectionId: collectionId,
          key: attr.key,
          size: int.parse(attr.size),
          xrequired: attr.xrequired,
          array: attr.array,
          xdefault: attr.xdefault,
        );
        break;
    }
  }
}
