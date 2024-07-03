import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/map/map_screen.dart';
import 'screens/track_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/restaurants/restaurants_screen.dart';
import 'screens/createRestaurant/create_restaurant.dart'; // Import the RestaurantFormScreen
import 'screens/createDish/create_dish.dart'; // Import the DishFormScreen

class Routes {
  static const String homeRoute = '/home';
  static const String searchRoute = '/search';
  static const String settingsRoute = '/settings';
  static const String profileRoute = '/profile';
  static const String restaurantFormRoute = '/restaurant_form';
  static const String dishFormRoute = '/dish_form';

  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => HomeScreen(),
    searchRoute: (context) => MapScreen(),
    settingsRoute: (context) => TrackScreen(),
    profileRoute: (context) => ProfileScreen(),
    restaurantFormRoute: (context) => RestaurantFormScreen(),
    dishFormRoute: (context) => DishFormScreen(), // Add the route
  };
}
