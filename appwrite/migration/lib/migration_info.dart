import 'package:migration/migration_runner.dart';

class MigrationInfo {
  final int version;
  final VersionBuilder builder;

  MigrationInfo({
    required this.version,
    required this.builder,
  });
}
