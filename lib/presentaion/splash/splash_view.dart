import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutapp/presentaion/resources/assets_manager.dart';
import 'package:tutapp/presentaion/resources/color_manager.dart';
import 'package:tutapp/presentaion/resources/const_manager.dart';
import 'package:tutapp/presentaion/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  void _delaySplah() {
    _timer = Timer(const Duration(seconds: AppConst.splashScreenDuration), () {
      Navigator.of(context).pushReplacementNamed(RoutesManager.onBoarding);
    });
  }

  @override
  void initState() {
    super.initState();
    _delaySplah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: Image.asset(
          ImageAssets.splash,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
