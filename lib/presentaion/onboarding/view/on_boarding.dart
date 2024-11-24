import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutapp/presentaion/onboarding/view/widgets/on_boarding_item.dart';
import 'package:tutapp/presentaion/resources/assets_manager.dart';
import 'package:tutapp/presentaion/resources/color_manager.dart';
import 'package:tutapp/presentaion/resources/routes_manager.dart';
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: AppMargin.m16),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    //navigate to next screen
                    Navigator.of(context)
                        .pushReplacementNamed(RoutesManager.logIn);
                  },
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
            //widget indicator for pageview
            _gitBottomIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _gitBottomIndicator() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      color: ColorManager.primaryColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //left arrow
        Padding(
          padding: EdgeInsets.only(left: AppMargin.m16),
          child: InkWell(
            onTap: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: SizedBox(
              width: AppMargin.m24,
              height: AppMargin.m24,
              child: SvgPicture.asset(
                ImageAssets.onBoardingBack,
                width: AppMargin.m24,
                height: AppMargin.m24,
                color:
                    currentIndex == 0 ? ColorManager.grey : ColorManager.black,
              ),
            ),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < slides.length; i++)
              Padding(
                  padding: EdgeInsets.only(right: AppMargin.m8),
                  child: SvgPicture.asset(ImageAssets.onBoardingDots,
                      width: AppMargin.m8,
                      height: AppMargin.m8,
                      color: currentIndex == i
                          ? ColorManager.white
                          : ColorManager.grey)),
          ],
        ),

        //right arrow
        Padding(
          padding: EdgeInsets.only(right: AppMargin.m16),
          child: InkWell(
            onTap: () {
              if (currentIndex == slides.length - 1) {
                //navigate to next screen
                Navigator.of(context).pushReplacementNamed(RoutesManager.logIn);
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: SizedBox(
              width: AppMargin.m24,
              height: AppMargin.m24,
              child: SvgPicture.asset(ImageAssets.onBoardingNext,
                  width: AppMargin.m24,
                  height: AppMargin.m24,
                  color: ColorManager.white),
            ),
          ),
        ),
      ]),
    );
  }
}

class SliderObject {
  final String image;
  final String title;
  final String description;

  SliderObject(this.image, this.title, this.description);
}
