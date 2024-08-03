import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG support
import '../../models/cuisine.dart';

class AllCuisinesScreen extends StatelessWidget {
  final List<Cuisine> cuisines;

  AllCuisinesScreen({required this.cuisines});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Cuisines'),
      ),
      body: ListView.builder(
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          final cuisine = cuisines[index];
          return ListTile(
            leading: SvgPicture.asset(
              cuisine.svgIconPath, // Use SVG path
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(cuisine.name),
          );
        },
      ),
    );
  }
}
