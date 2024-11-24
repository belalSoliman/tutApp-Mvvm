import 'package:flutter/material.dart';
import 'package:tutapp/navigation_observal.dart';
import 'package:tutapp/presentaion/resources/routes_manager.dart';
import 'package:tutapp/presentaion/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ScreenCountObserver _screenCountObserver = ScreenCountObserver();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.generateRoute,
      title: 'TutApp',
      theme: getAppTheme(),
      initialRoute: RoutesManager.splash,
      navigatorObservers: [_screenCountObserver],
    );
  }
}
