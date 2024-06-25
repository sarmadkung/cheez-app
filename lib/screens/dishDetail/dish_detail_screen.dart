import 'package:flutter/material.dart';

class DishDetailsScreen extends StatelessWidget {
  final String dishName;

  const DishDetailsScreen({Key? key, required this.dishName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dishName),
      ),
      body: Center(
        child: Text(
          'Details of $dishName',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
