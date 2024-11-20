import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutapp/presentaion/resources/assets_manager.dart';
import 'package:tutapp/presentaion/resources/color_manager.dart';
import 'package:tutapp/presentaion/resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  final List<SliderObject> slides = [
    SliderObject(
      ImageAssets.onBoarding1,
      StringsManager.onBoardingTitle1,
      StringsManager.onBoardingDescription1,
    ),
    SliderObject(
      ImageAssets.onBoarding2,
      StringsManager.onBoardingTitle2,
      StringsManager.onBoardingDescription2,
    ),
    SliderObject(
      ImageAssets.onBoarding3,
      StringsManager.onBoardingTitle3,
      StringsManager.onBoardingDescription3,
    ),
    SliderObject(
      ImageAssets.onBoarding4,
      StringsManager.onBoardingTitle4,
      StringsManager.onBoardingDescription4,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: slides.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
              print(currentIndex);
            });
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  slides[index].title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  slides[index].description,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorManager.grey,
                  ),
                ),
                SvgPicture.asset(
                  slides[index].image,
                  height: 300,
                ),
              ],
            );
          }),
    );
  }
}

class SliderObject {
  final String image;
  final String title;
  final String description;

  SliderObject(this.image, this.title, this.description);
}
