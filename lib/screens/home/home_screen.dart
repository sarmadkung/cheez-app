// home_screen.dart
import 'package:flutter/material.dart';
import '../../components/custom_search_bar.dart'; // Import the renamed search bar component
import './restaurant_card.dart';
import '../restaurantDetail/restaurant_detail_screen.dart'; // Import the restaurant detail screen
import '../allRestaurants/all_restaurants_screen.dart'; // Import the all restaurants screen
import '../../components/logo.dart'; // Import the Logo widget

// Define a restaurant model
class Restaurant {
  final String imageUrl;
  final String title;
  final int id;

  Restaurant({
    required this.imageUrl,
    required this.title,
    required this.id,
  });
}

class HomeScreen extends StatelessWidget {
  // Define a list of Restaurant objects
  final List<Restaurant> restaurants = [
    Restaurant(imageUrl: 'assets/cheez.png', title: 'Restaurant 1', id: 1),
    Restaurant(imageUrl: 'assets/cheez.png', title: 'Restaurant 2', id: 2),
    Restaurant(imageUrl: 'assets/cheez.png', title: 'Restaurant 3', id: 3),
    Restaurant(imageUrl: 'assets/cheez.png', title: 'Restaurant 4', id: 4),
    Restaurant(imageUrl: 'assets/cheez.png', title: 'Restaurant 5', id: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF8F8F8), // Off-white background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
          children: [
            CustomSearchBar(
              selectedItemColor: Color.fromARGB(255, 2, 165, 43),
              unselectedItemColor: Colors.black54,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and button
                children: [
                  Text(
                    'Popular Restaurants',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllRestaurantsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(color: Color.fromARGB(255, 49, 180, 1)), // Style the text button
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 210, // Set the height of the restaurant card list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0.0, right: 8.0),
                    child: RestaurantCard(
                      imageUrl: restaurant.imageUrl,
                      title: restaurant.title,
                      id: restaurant.id,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
