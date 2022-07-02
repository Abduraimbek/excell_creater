import 'package:excell_creater/wrapper.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Excell Creater",
      home: const Wrapper(),
      theme: FlexThemeData.light(
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        scheme: FlexScheme.aquaBlue,
      ),
    );
  }
}
