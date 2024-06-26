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
    {
      'title': 'Rice',
      'dishes': [
        {'title': 'Chicken Rice', 'id': 1, 'rating': 4.5},
        {'title': 'Fried Rice', 'id': 2, 'rating': 4.0},
        {'title': 'Rice with Veggies', 'id': 3, 'rating': 3.5},
      ]
    },
    {
      'title': 'Meat',
      'dishes': [
        {'title': 'Grilled Meat', 'id': 4, 'rating': 4.5},
        {'title': 'Steak', 'id': 5, 'rating': 4.0},
        {'title': 'Meatballs', 'id': 6, 'rating': 3.5},
      ]
    },
    {
      'title': 'Arabic',
      'dishes': [
        {'title': 'Shawarma', 'id': 7, 'rating': 4.5},
        {'title': 'Falafel', 'id': 8, 'rating': 4.0},
        {'title': 'Hummus', 'id': 9, 'rating': 3.5},
      ]
    },
    {
      'title': 'Chinese',
      'dishes': [
        {'title': 'Kung Pao Chicken', 'id': 10, 'rating': 4.5},
        {'title': 'Sweet and Sour Pork', 'id': 11, 'rating': 4.0},
        {'title': 'Spring Rolls', 'id': 12, 'rating': 3.5},
      ]
    },
    {
      'title': 'Fast Food',
      'dishes': [
        {'title': 'Burger', 'id': 13, 'rating': 4.5},
        {'title': 'Pizza', 'id': 14, 'rating': 4.0},
        {'title': 'Fries', 'id': 15, 'rating': 3.5},
      ]
    },
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
    return BaseLayout(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: category['dishes'].map<Widget>((dish) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: RestaurantDetailCard(
                              imageUrl: 'assets/cheez.png', // Placeholder image
                              title: dish['title'],
                              rating: dish['rating'],
                              id: dish['id'],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
