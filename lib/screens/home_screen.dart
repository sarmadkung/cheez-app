import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF8F8F8), // Off-white background color
        child: Center(
          child: Text(
            'Home here',
            style: TextStyle(
              color: Colors.black, // Black text color
              fontSize: 24.0, // Adjust the font size as needed
            ),
          ),
        ),
      ),
    );
  }
}
