import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:loggy/loggy.dart';
import 'package:migration/migration_info.dart';
import 'package:migration/migration_runner.dart';

import 'version_1.dart';

const projectIdKey = 'PROJECT_ID';
const apiEndpointKey = 'API_ENDPOINT';
const secretKey = 'SECRET_KEY';

void main(List<String> arguments) {
  Loggy.initLoggy(logPrinter: const PrettyPrinter());
  load();
  if (!isEveryDefined([projectIdKey, apiEndpointKey, secretKey])) {
    logError('Environment variables [$projectIdKey, $apiEndpointKey, $secretKey] is not defined!');
    exit(1);
  }
  final migration = MigrationRunner(
    projectId: env[projectIdKey]!,
    apiEndpoint: env[apiEndpointKey]!,
    secretApiKey: env[secretKey]!,
  );

  migration.runMigrations([
    MigrationInfo(version: 1, builder: (migration) => MigrationVersion1(migration)),
    MigrationInfo(version: 2, builder: (migration) => MigrationVersion1(migration)),
    MigrationInfo(version: 3, builder: (migration) => MigrationVersion1(migration)),
    MigrationInfo(version: 4, builder: (migration) => MigrationVersion1(migration)),
  ]).catchError((e, st) {
    logError('${e.toString()}\n${st.toString()}');
  });
}
