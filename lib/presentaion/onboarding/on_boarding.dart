import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutapp/presentaion/resources/color_manager.dart';
import 'package:tutapp/presentaion/resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final List<SliderObject> slides = [
    SliderObject(
      'assets/images/onboarding1.png',
      StringsManager.onBoardingTitle1,
      StringsManager.onBoardingDescription1,
    ),
    SliderObject(
      'assets/images/onboarding2.png',
      StringsManager.onBoardingTitle2,
      StringsManager.onBoardingDescription2,
    ),
    SliderObject(
      'assets/images/onboarding3.png',
      StringsManager.onBoardingTitle3,
      StringsManager.onBoardingDescription3,
    ),
    SliderObject(
      'assets/images/onboarding4.png',
      StringsManager.onBoardingTitle4,
      StringsManager.onBoardingDescription4,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: Text('OnBoarding'),
      ),
    );
  }
}

class SliderObject {
  final String image;
  final String title;
  final String description;

  SliderObject(this.image, this.title, this.description);
}
