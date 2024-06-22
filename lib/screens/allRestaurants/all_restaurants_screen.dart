import 'package:flutter/material.dart';

class AllRestaurantsScreen extends StatelessWidget {
  const AllRestaurantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Restaurants'),
      ),
      body: Center(
        child: Text(
          'List of all restaurants',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
