import 'package:cheez/components/bottom_navigation_bar.dart';
import 'package:cheez/screens/home/home_screen.dart';
import 'package:cheez/screens/map/map_screen.dart';
import 'package:cheez/screens/profile/profile_screen.dart';
import 'package:cheez/screens/track_screen.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
     HomeScreen(),
     MapScreen(),
     TrackScreen(),
     ProfileScreen(),
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
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
