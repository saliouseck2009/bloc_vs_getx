import 'package:bloc_test_1/presentations/screens/page1.dart';
import 'package:bloc_test_1/presentations/screens/page2.dart';
import 'package:flutter/material.dart';
import '../screens/home.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CounterPage());
        break;
      case '/page1':
        return MaterialPageRoute(builder: (_) => Page1());
        break;
      case '/page2':
        return MaterialPageRoute(builder: (_) => Page2());
      default:
      //return _errorRoute
    }
  }
}
