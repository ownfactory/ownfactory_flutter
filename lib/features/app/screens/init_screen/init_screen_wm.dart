import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ownfactory_flutter/features/app/screens/init_screen/init_screen.dart';
import 'package:ownfactory_flutter/utils/stub_model.dart';

class InitScreenWM extends WidgetModel<InitScreen, StubModel> {
  InitScreenWM() : super(StubModel());
}

InitScreenWM createInitScreenWM(BuildContext context) => InitScreenWM();
