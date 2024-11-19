import 'package:flutter/material.dart';

class ScreenCountObserver extends NavigatorObserver {
  int screenCount = 0;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    screenCount++;
    print('Screen pushed, total screens: $screenCount');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    screenCount--;
    print('Screen popped, total screens: $screenCount');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    screenCount--;
    print('Screen removed, total screens: $screenCount');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // No change in screen count for replace
    print('Screen replaced, total screens: $screenCount');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
