import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/restaurant_provider.dart';
import 'providers/dish_provider.dart';
import 'screens/login/login_screen.dart'; // Import your LoginScreen
import 'routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => DishProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home:  LoginScreen(), // Set LoginScreen as the initial screen
      routes: Routes.routes, // Define the routes
    );
  }
}
