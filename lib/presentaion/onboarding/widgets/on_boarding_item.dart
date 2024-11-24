import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutapp/presentaion/onboarding/on_boarding.dart';
import 'package:tutapp/presentaion/resources/values_manager.dart';

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
