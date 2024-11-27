//onBoarding models
class SliderObject {
  final String image;
  final String title;
  final String description;

  SliderObject(this.image, this.title, this.description);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSliders;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numberOfSliders, this.currentIndex);
}

//login models

