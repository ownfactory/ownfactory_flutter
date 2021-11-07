import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/di/di_container.dart';
import 'package:ownfactory_flutter/runner.dart';

//Main entry point of app
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDi(Environment.dev);
  await runApplication();
}
