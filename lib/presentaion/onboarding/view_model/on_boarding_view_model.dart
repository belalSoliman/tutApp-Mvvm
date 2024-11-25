import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutapp/domain/models.dart';
import 'package:tutapp/presentaion/base/base_view_model.dart';
import 'package:tutapp/presentaion/resources/assets_manager.dart';
import 'package:tutapp/presentaion/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController<List<SliderObject>> _streamController =
      StreamController<List<SliderObject>>();
  int currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // Initialize the stream with the initial slides
    inputSink.add(slides);
  }

  @override
  void goBack(PageController pageController) {
    // Implement goBack logic
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void goNext(PageController pageController) {
    // Implement goNext logic
    if (currentIndex == slides.length - 1) {
      // This should be handled in the view
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onpageChanged(int page) {
    currentIndex = page;
  }

  @override
  void skip() {
    // Implement skip logic
  }

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
  Sink<List<SliderObject>> get inputSink => _streamController.sink;

  @override
  Stream<List<SliderObject>> get outPutSliderObject => _streamController.stream;
}

// input means the events that will be triggered from the UI
abstract class OnBoardingViewModelInputs {
  void goNext(PageController pageController);
  void goBack(PageController pageController);
  void skip();
  void onpageChanged(int page);
  Sink<List<SliderObject>> get inputSink;
}

abstract class OnBoardingViewModelOutputs {
  Stream<List<SliderObject>> get outPutSliderObject;
}
