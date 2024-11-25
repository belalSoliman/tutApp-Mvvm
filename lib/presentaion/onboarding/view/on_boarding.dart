import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutapp/domain/models.dart';
import 'package:tutapp/presentaion/onboarding/view/widgets/on_boarding_item.dart';
import 'package:tutapp/presentaion/onboarding/view_model/on_boarding_view_model.dart';
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
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

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
      body: StreamBuilder<List<SliderObject>>(
        stream: _viewModel.outPutSliderObject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final slides = snapshot.data!;
            return PageView.builder(
              controller: _pageController,
              itemCount: slides.length,
              onPageChanged: (index) {
                _viewModel.onpageChanged(index);
              },
              itemBuilder: (context, index) {
                return OnBoardingItem(slides: slides[index]);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomSheet: _getBottomSheet(),
    );
  }

  Widget _getBottomSheet() {
    return Container(
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
          _getBottomIndicator(),
        ],
      ),
    );
  }

  Widget _getBottomIndicator() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      color: ColorManager.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left arrow
          Padding(
            padding: EdgeInsets.only(left: AppMargin.m16),
            child: InkWell(
              onTap: () {
                _viewModel.goBack(_pageController);
              },
              child: SizedBox(
                width: AppMargin.m24,
                height: AppMargin.m24,
                child: SvgPicture.asset(
                  ImageAssets.onBoardingBack,
                  width: AppMargin.m24,
                  height: AppMargin.m24,
                  color: _viewModel.currentIndex == 0
                      ? ColorManager.grey
                      : ColorManager.black,
                ),
              ),
            ),
          ),
          // Dots indicator
          Row(
            children: List.generate(
              _viewModel.slides.length,
              (index) => Padding(
                padding: EdgeInsets.only(right: AppMargin.m8),
                child: SvgPicture.asset(
                  ImageAssets.onBoardingDots,
                  width: AppMargin.m8,
                  height: AppMargin.m8,
                  color: _viewModel.currentIndex == index
                      ? ColorManager.white
                      : ColorManager.grey,
                ),
              ),
            ),
          ),
          // Right arrow
          Padding(
            padding: EdgeInsets.only(right: AppMargin.m16),
            child: InkWell(
              onTap: () {
                if (_viewModel.currentIndex == _viewModel.slides.length - 1) {
                  Navigator.of(context)
                      .pushReplacementNamed(RoutesManager.logIn);
                } else {
                  _viewModel.goNext(_pageController);
                }
              },
              child: SizedBox(
                width: AppMargin.m24,
                height: AppMargin.m24,
                child: SvgPicture.asset(
                  ImageAssets.onBoardingNext,
                  width: AppMargin.m24,
                  height: AppMargin.m24,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
