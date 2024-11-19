import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import for defaultTargetPlatform
import 'package:tutapp/presentaion/forget_password/forget_pass.dart';
import 'package:tutapp/presentaion/home/home_view.dart';
import 'package:tutapp/presentaion/login/login.dart';
import 'package:tutapp/presentaion/onboarding/on_boarding.dart';
import 'package:tutapp/presentaion/siginup/sign_up_view.dart';
import 'package:tutapp/presentaion/splash/splash_view.dart';

class RoutesManager {
  const RoutesManager._();
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String logIn = '/logIn';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;

    switch (settings.name) {
      case splash:
        return _buildRoute(SplashView(), isIOS);
      case onBoarding:
        return _buildRoute(OnBoardingView(), isIOS);
      case logIn:
        return _buildRoute(LoginView(), isIOS);
      case signUp:
        return _buildRoute(SignUpView(), isIOS);
      case forgotPassword:
        return _buildRoute(ForgetPassView(), isIOS);
      case home:
        return _buildRoute(HomeView(), isIOS);
      default:
        return _buildRoute(Container(), isIOS);
    }
  }

  static Route<dynamic> _buildRoute(Widget widget, bool isIOS) {
    return isIOS
        ? CupertinoPageRoute(builder: (_) => widget)
        : MaterialPageRoute(builder: (_) => widget);
  }
}
