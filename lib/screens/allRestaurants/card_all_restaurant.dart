// restaurant_card.dart
import 'package:flutter/material.dart';
import '../restaurantDetail/restaurant_detail_screen.dart'; // Import the restaurant detail screen

class AllRestaurantCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int id;

  const AllRestaurantCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailScreen(restaurantId: id),
          ),
        );
      },
      child: Card(
        elevation: 1.0, // Increased elevation for a more prominent shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: 150, // Set the height of the card to match the container in HomeScreen
          width: 180, // Set the width of the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image.asset(
                  imageUrl,
                  height: 140, // Adjust image height as needed
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Spacer(), // Takes up the remaining space
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ID: $id', // Display the ID property
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
