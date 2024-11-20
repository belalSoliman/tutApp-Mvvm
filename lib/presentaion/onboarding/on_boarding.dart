import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                    style: Theme.of(context).textTheme.headlineMedium,
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

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.slides,
  });

  final SliderObject slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: AppMargin.m12,
        ),
        Text(
          slides.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: AppMargin.m12,
        ),
        Text(
          slides.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: AppMargin.m40,
        ),
        SvgPicture.asset(
          slides.image,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
      ],
    );
  }
}

class SliderObject {
  final String image;
  final String title;
  final String description;

  SliderObject(this.image, this.title, this.description);
}
