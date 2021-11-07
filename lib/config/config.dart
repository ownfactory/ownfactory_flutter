import 'package:ownfactory_flutter/config/build_types.dart';
import 'package:ownfactory_flutter/features/debug/domain/debug_options.dart';

/// Application configuration
class Config {
  final String endpoint;
  final String projectId;
  final String proxyUrl;
  final DebugOptions debugOptions;
  final BuildType buildType;

  Config({
    required this.endpoint,
    required this.projectId,
    required this.debugOptions,
    required this.buildType,
    this.proxyUrl = '',
  });

  Config copyWith({
    String? endpoint,
    String? projectId,
    String? proxyUrl,
    DebugOptions? debugOptions,
    BuildType? buildType,
  }) =>
      Config(
        endpoint: endpoint ?? this.endpoint,
        projectId: projectId ?? this.projectId,
        proxyUrl: proxyUrl ?? this.proxyUrl,
        debugOptions: debugOptions ?? this.debugOptions,
        buildType: buildType ?? this.buildType,
      );
}
