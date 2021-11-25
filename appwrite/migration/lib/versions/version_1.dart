import 'package:migration/migration.dart';
import 'package:migration/migration_version.dart';

class MigrationVersion1 extends MigrationVersion {
  MigrationVersion1(Migration migration) : super(migration);

  @override
  Future<bool> versionUp() async {
    await migration.createCollection('./assets/collections/products.json');

    return true;
  }
}
