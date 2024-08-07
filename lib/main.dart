import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/restaurant_provider.dart';
import 'providers/dish_provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/map/map_screen.dart';
import 'screens/track_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/restaurants/restaurants_screen.dart';
import 'bottom_navigation_bar.dart';
import 'routes.dart'; // Import routes

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => DishProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F5), // Set global background color
      ),
      home: BottomNavigationBarExample(),
      routes: Routes.routes, // Register routes
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MapScreen(),
    TrackScreen(),
    ProfileScreen(),
    AllRestaurantsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _widgetOptions,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.dishFormRoute);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
