import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:ownfactory_flutter/features/app/screens/coming_soon/coming_soon_screen_wm.dart';

class ComingSoonScreenRoute extends MaterialPageRoute<void> {
  ComingSoonScreenRoute() : super(builder: (_) => const ComingSoonScreen());
}

class ComingSoonScreen extends ElementaryWidget<ComingSoonScreenWM> {
  const ComingSoonScreen({
    Key? key,
    WidgetModelFactory wmFactory = createComingSoonScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ComingSoonScreenWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming soon'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.broken_image,
              size: 50,
              color: Colors.indigo,
            ),
            SizedBox(height: 50),
            Text(
              'Coming soon',
              style: TextStyle(
                fontSize: 25,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
