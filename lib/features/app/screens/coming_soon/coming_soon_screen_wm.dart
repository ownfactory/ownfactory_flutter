import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ownfactory_flutter/features/app/screens/coming_soon/coming_soon_screen.dart';
import 'package:ownfactory_flutter/utils/stub_model.dart';

ComingSoonScreenWM createComingSoonScreenWM(BuildContext context) {
  return ComingSoonScreenWM();
}

class ComingSoonScreenWM extends WidgetModel<ComingSoonScreen, StubModel> {
  ComingSoonScreenWM() : super(StubModel());
}
