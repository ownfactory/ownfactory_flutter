import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:loggy/loggy.dart';
import 'package:structure_creator/structure_creator.dart';

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

  final sc = StructureCreator(
    projectId: env[projectIdKey]!,
    apiEndpoint: env[apiEndpointKey]!,
    secretApiKey: env[secretKey]!,
  );
  sc.run();
}
