// all_restaurants_screen.dart
import 'package:flutter/material.dart';
import '../home/restaurant_card.dart'; // Make sure to update the import statement
import '../../bottom_navigation_bar.dart'; // Import the bottom navigation bar

class Restaurant {
  final String imageUrl;
  final String title;
  final int id;
  final double rating;


  Restaurant({
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.rating
  });
}

class AllRestaurantsScreen extends StatelessWidget {
  final List<Restaurant> restaurants = List.generate(
    10,
    (index) => Restaurant(
      imageUrl: 'assets/cheez.png',
      title: 'Restaurant ${index + 1}',
      id: index + 1,
      rating: 1.1
    ),
  );

  AllRestaurantsScreen({Key? key}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navigate to HomeScreen or any other screen
        break;
      case 1:
        // Navigate to MapScreen or any other screen
        break;
      case 2:
        // Navigate to TrackScreen or any other screen
        break;
      case 3:
        // Navigate to ProfileScreen or any other screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Restaurants'),
      ),
      body: Container(
        color: Color(0xFFF8F8F8), // Off-white background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and button
                children: [
                  Text(
                    'Restaurants',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75, // Adjust the aspect ratio as needed
                ),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return RestaurantCard(
                    imageUrl: restaurant.imageUrl,
                    title: restaurant.title,
                    id: restaurant.id,
                    rating: 1.1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0, // Adjust as necessary
        onItemTapped: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
