// restaurant_detail_card.dart

import 'package:flutter/material.dart';
import '../categories/categories.dart'; // Import DetailDishScreen

class RestaurantDetailCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;

  const RestaurantDetailCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail screen with dish details
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoriesScreen(title: title),
          ),
        );
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: 190, // Reduced height
          width: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      imageUrl,
                      height: 100, // Original image height
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.0, // Original font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                'Rating: $rating',
                style: TextStyle(
                  fontSize: 12.0, // Original font size
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
