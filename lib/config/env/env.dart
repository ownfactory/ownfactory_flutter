import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/config/appwrite_config.dart';
import 'package:ownfactory_flutter/config/build_types.dart';
import 'package:ownfactory_flutter/config/config.dart';
import 'package:ownfactory_flutter/domain/debug_options.dart';

/// Environment configuration
@Singleton(env: [Environment.prod])
class Env extends ChangeNotifier {
  Config get config => _config;

  BuildType get buildType => _config.buildType;

  bool get isDebug => buildType != BuildType.release;

  String get endpoint => _config.endpoint;

  String get projectId => _config.projectId;

  String get proxyUrl => _config.proxyUrl;

  DebugOptions get debugOptions => _config.debugOptions;

  set config(Config value) {
    _config = value;
    notifyListeners();
  }

  set buildType(BuildType value) {
    _config = _config.copyWith(buildType: value);
    notifyListeners();
  }

  set endpoint(String value) {
    _config = _config.copyWith(endpoint: value);
    notifyListeners();
  }

  set projectId(String value) {
    _config = _config.copyWith(projectId: value);
    notifyListeners();
  }

  set proxyUrl(String value) {
    _config = _config.copyWith(proxyUrl: value);
    notifyListeners();
  }

  set debugOptions(DebugOptions value) {
    _config = _config.copyWith(debugOptions: value);
    notifyListeners();
  }

  Config _config;

  Env()
      : _config = Config(
          buildType: BuildType.release,
          endpoint: AppwriteConfig.endpointProd,
          projectId: AppwriteConfig.projectIdProd,
          debugOptions: DebugOptions(),
        );
}
