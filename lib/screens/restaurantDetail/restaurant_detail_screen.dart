// restaurant_detail_screen.dart

import 'package:flutter/material.dart';
import 'restaurant_detail_card.dart';
import '../../layouts/base_layout.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final int restaurantId;
  final String restaurantTitle;

  const RestaurantDetailScreen({
    Key? key,
    required this.restaurantId,
    required this.restaurantTitle,
  }) : super(key: key);

  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> categories = [
    {'title': 'Rice', 'dishes': ['Rice Dish']},
    {'title': 'Meat', 'dishes': ['Meat Dish']},
    {'title': 'Arabic', 'dishes': ['Arabic Dish']},
    {'title': 'Chinese', 'dishes': ['Chinese Dish']},
    {'title': 'Fast Food', 'dishes': ['Fast Food Dish']},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Restaurant Details'), // Replace with your preferred title
      ),
      body: BaseLayout(
        selectedIndex: 0, // Set the selected index accordingly
        onItemTapped: (index) {
          // Handle navigation based on index
          switch (index) {
            case 0:
              // Navigate to HomeScreen or any other screen
              break;
            case 1:
              // Navigate to SearchScreen or any other screen
              break;
            case 2:
              // Navigate to ProfileScreen or any other screen
              break;
          }
        },
        body: FadeTransition(
          opacity: _animation,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                ...categories.map((category) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category['title'],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      RestaurantDetailCard(
                        imageUrl: 'assets/cheez.png', // Placeholder image
                        title: category['dishes'][0], // Only the first dish
                        rating: 4.0, // Adjust rating as needed
                      ),
                      SizedBox(height: 16.0),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
