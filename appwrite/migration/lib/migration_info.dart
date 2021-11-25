import 'package:migration/migration_runner.dart';

class MigrationInfo extends Comparable<MigrationInfo> {
  final int version;
  final VersionBuilder builder;

  MigrationInfo({
    required this.version,
    required this.builder,
  });

  @override
  int compareTo(MigrationInfo other) {
    return version.compareTo(other.version);
  }
}
