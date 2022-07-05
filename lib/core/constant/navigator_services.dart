import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,Map argument) {
    return navigatorKey.currentState!.pushNamed(routeName,arguments: argument);
  }

  goBack() {
    return navigatorKey.currentState!.pop();
  }
}