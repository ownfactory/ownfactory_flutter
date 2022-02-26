import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ownfactory_flutter/features/app/screens/init_screen/init_screen_wm.dart';
import 'package:ownfactory_flutter/ui/res/assets.dart';

class InitScreen extends ElementaryWidget<InitScreenWM> {
  const InitScreen({
    Key? key,
    WidgetModelFactory wmFactory = createInitScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(InitScreenWM wm) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              AssetsIcons.icEcoFactory,
              height: 100,
              color: Colors.indigo,
            ),
            const SizedBox(height: 100),
            const Text(
              'OwnFactory',
              style: TextStyle(
                fontSize: 30,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
