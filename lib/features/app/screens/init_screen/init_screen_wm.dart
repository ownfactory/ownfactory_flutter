import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ownfactory_flutter/di/di_container.dart';
import 'package:ownfactory_flutter/features/app/screens/init_screen/init_screen.dart';
import 'package:ownfactory_flutter/ui/app/counter_app.dart';
import 'package:ownfactory_flutter/utils/stub_model.dart';

InitScreenWM createInitScreenWM(BuildContext context) {
  return InitScreenWM(
    getIt<GlobalKey<NavigatorState>>().currentState!,
  );
}

const _splashDuration = Duration(seconds: 2);

class InitScreenWM extends WidgetModel<InitScreen, StubModel> {
  final NavigatorState _rootNavigator;

  InitScreenWM(
    this._rootNavigator,
  ) : super(StubModel());

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    Future<void>.delayed(_splashDuration).then<void>(
      (_) => _rootNavigator.pushReplacement(
        MaterialPageRoute(
          builder: (_) => const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
