import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final int restaurantId;

  const RestaurantDetailScreen({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Details'),
      ),
      body: Center(
        child: Text(
          'Details for Restaurant ID: $restaurantId',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
