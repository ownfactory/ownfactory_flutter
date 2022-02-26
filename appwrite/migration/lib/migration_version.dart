import 'package:migration/migration.dart';

abstract class MigrationVersion {
  final Migration migration;

  MigrationVersion(this.migration);

  Future<bool> versionUp();
}
