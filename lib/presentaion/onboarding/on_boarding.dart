import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutapp/presentaion/onboarding/widgets/on_boarding_item.dart';
import 'package:tutapp/presentaion/resources/assets_manager.dart';
import 'package:tutapp/presentaion/resources/color_manager.dart';
import 'package:tutapp/presentaion/resources/strings_manager.dart';
import 'package:tutapp/presentaion/resources/values_manager.dart';

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
            return OnBoardingItem(slides: slides[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppMargin.m16),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    StringsManager.onBoardingSkip,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: ColorManager.primaryColor,
                        ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            //indicator widget
          ],
        ),
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
