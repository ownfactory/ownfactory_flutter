import 'package:migration/migration.dart';
import 'package:migration/migration_version.dart';

class MigrationVersionEmpty extends MigrationVersion {
  MigrationVersionEmpty(Migration migration) : super(migration);

  @override
  Future<bool> versionUp() async {
    return true;
  }
}
