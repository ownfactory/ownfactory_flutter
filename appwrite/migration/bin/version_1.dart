import 'package:loggy/loggy.dart';
import 'package:migration/migration.dart';
import 'package:migration/migration_version.dart';

class MigrationVersion1 extends MigrationVersion {
  MigrationVersion1(Migration migration) : super(migration);

  @override
  bool versionUp() {
    logDebug('Add here some actions to migrate');

    return true;
  }
}
