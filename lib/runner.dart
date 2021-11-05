import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:loggy/loggy.dart';
import 'package:ownfactory_flutter/ui/app/counter_app.dart';

Future<void> runApplication() async {
  // pin orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  _initLogger();
  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async {
      runApp(const CounterApp());
    },
    (error, stacktrace) {
      logError('Unhandled exception was caught $error');
      logDebug(stacktrace.toString());
    },
  );
}

void _initLogger() {
  Loggy.initLoggy(
    logPrinter: const PrettyDeveloperPrinter(),
  );
}
