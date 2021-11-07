import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:ownfactory_flutter/config/env/env.dart';
import 'package:ownfactory_flutter/di/di_container.dart';
import 'package:ownfactory_flutter/features/app/app.dart';
import 'package:ownfactory_flutter/features/app/app_model.dart';
import 'package:ownfactory_flutter/features/debug/domain/debug_options.dart';

AppWM createAppWM(BuildContext context) {
  return AppWM(AppModel());
}

class AppWM extends WidgetModel<App, AppModel> {
  /// root navigator
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  /// debug option state
  final debugOptionsState = StateNotifier<DebugOptions>(initValue: getIt<Env>().debugOptions);

  AppWM(AppModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    getIt.registerSingleton<GlobalKey<NavigatorState>>(rootNavigatorKey);

    getIt<Env>().addListener(_envChangeListener);
  }

  @override
  void dispose() {
    getIt<Env>().removeListener(_envChangeListener);
    super.dispose();
  }

  void _envChangeListener() => debugOptionsState.accept(getIt<Env>().debugOptions);
}
