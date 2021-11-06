import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/config/appwrite_config.dart';
import 'package:ownfactory_flutter/config/build_types.dart';
import 'package:ownfactory_flutter/config/config.dart';
import 'package:ownfactory_flutter/config/env/env.dart';
import 'package:ownfactory_flutter/features/debug/domain/debug_options.dart';

/// Environment configuration
@Singleton(as: Env, env: [Environment.dev])
class DevEnv extends Env {
  DevEnv() {
    config = Config(
      buildType: BuildType.release,
      endpoint: AppwriteConfig.endpointDev,
      projectId: AppwriteConfig.projectIdDev,
      proxyUrl: AppwriteConfig.proxyUrlDev,
      debugOptions: DebugOptions(
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
