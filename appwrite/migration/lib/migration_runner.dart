import 'package:loggy/loggy.dart';
import 'package:migration/domain/collection_object.dart';
import 'package:migration/domain/metadata_collection.dart';
import 'package:migration/domain/migration_metadata.dart';
import 'package:migration/migration.dart';
import 'package:migration/migration_info.dart';
import 'package:migration/migration_version.dart';

typedef VersionBuilder = MigrationVersion Function(Migration migration);

class MigrationRunner {
  final String projectId;
  final String apiEndpoint;
  final String secretApiKey;

  late MigrationMetadata _currentMetadata;

  int get _currentVersion => _currentMetadata.version;

  MigrationRunner({
    required this.projectId,
    required this.apiEndpoint,
    required this.secretApiKey,
  });

  Future<void> runMigrations(List<MigrationInfo> allVersions) async {
    logInfo('Start migration runner');
    final migration = Migration(
      apiEndpoint: apiEndpoint,
      projectId: projectId,
      secretApiKey: secretApiKey,
      createCollectionCallback: _createCollectionCallback,
    );

    _currentMetadata = await _getMetadata(migration);
    logInfo('Found version "$_currentVersion"');

    // maybe need sort versions?
    allVersions.sort();
    final versions = allVersions.where((e) => e.version > _currentVersion);

    if (versions.isEmpty) {
      logInfo('No migration needed.');
      return;
    }

    for (final versionInfo in versions) {
      logInfo('Migrate from "$_currentVersion" to "${versionInfo.version}"');
      final version = versionInfo.builder(migration);

      bool isSuccess;
      try {
        isSuccess = await version.versionUp();
      } catch (e) {
        logError(e.toString());
        isSuccess = false;
      }

      if (isSuccess) {
        _currentMetadata = _currentMetadata.copyWith(version: versionInfo.version);
      } else {
        throw Exception('Migration to version ${versionInfo.version} fail');
      }
    }
    logInfo('All done. Save new metadata.');
    migration.saveMetadata(_currentMetadata);
  }

  Future<MigrationMetadata> _getMetadata(Migration migration) async {
    logInfo('Get migration metadata from Appwrite');
    MigrationMetadata? metadata = await migration.getMetadata();

    if (metadata == null) {
      await _initMigration(migration);
      metadata = await migration.getMetadata();
      if (metadata == null) {
        throw Exception('Something went wrong. Unable to save metadata');
      }
    }
    return metadata;
  }

  Future<void> _initMigration(Migration migration) async {
    logInfo('Initialize migration metadata in Appwrite project');
    final metadata = MigrationMetadata(version: 0, collections: []);
    await migration.initMetadata(metadata);
  }

  void _createCollectionCallback(CollectionObject collection) {
    final collections = [
      ..._currentMetadata.collections,
      MetadataCollection(id: collection.id!, name: collection.name),
    ];
    _currentMetadata = _currentMetadata.copyWith(
      collections: collections,
    );
  }
}
