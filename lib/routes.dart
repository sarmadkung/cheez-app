import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/track_screen.dart';
import 'screens/profile_screen.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String searchRoute = '/search';
  static const String settingsRoute = '/settings';
  static const String profileRoute = '/help';

  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => HomeScreen(),
    searchRoute: (context) => MapScreen(),
    settingsRoute: (context) => TrackScreen(),
    profileRoute: (context) => ProfileScreen(),
  };
}
