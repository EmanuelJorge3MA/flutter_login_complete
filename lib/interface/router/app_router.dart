import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
