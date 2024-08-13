import 'package:flutter/material.dart';
import 'screens/createDish/create_dish.dart'; // Import your DishFormScreen
import 'screens/bottom_navigation/bottom_navigation_screen.dart';
class Routes {
  static const String homeRoute = '/home';
  static const String dishFormRoute = '/dishForm';
  static const String bottomNavigationBarRoute = '/bottomNavigation';

  static final Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const BottomNavigationBarScreen(),
    dishFormRoute: (context) =>  DishFormScreen(),
  };
}
