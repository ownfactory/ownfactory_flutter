import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ownfactory_flutter/features/app/app_wm.dart';
import 'package:ownfactory_flutter/features/debug/domain/debug_options.dart';
import 'package:ownfactory_flutter/ui/app/counter_app.dart';
import 'package:ownfactory_flutter/ui/theme/app_theme.dart';

class App extends ElementaryWidget<AppWM> {
  const App({
    Key? key,
    WidgetModelFactory wmFactory = createAppWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(AppWM wm) {
    return StateNotifierBuilder<DebugOptions>(
      listenableState: wm.debugOptionsState,
      builder: (context, debugOptions) {
        return MaterialApp(
          navigatorKey: wm.rootNavigatorKey,

          // theme
          theme: AppTheme.defaultTheme,

          // debug options
          showPerformanceOverlay: debugOptions!.showPerformanceOverlay,
          debugShowMaterialGrid: debugOptions.debugShowMaterialGrid,
          checkerboardRasterCacheImages: debugOptions.checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: debugOptions.checkerboardOffscreenLayers,
          showSemanticsDebugger: debugOptions.showSemanticsDebugger,
          debugShowCheckedModeBanner: debugOptions.debugShowCheckedModeBanner,

          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
