import 'package:tutapp/presentaion/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }
}

// input means the events that will be triggered from the UI
abstract class OnBoardingViewModelInputs {
  void goNext();
  void goBack();
  void skip();
  void onpageChanged(int page);
}

abstract class OnBoardingViewModelOutputs {
  // will be implemented later
}
