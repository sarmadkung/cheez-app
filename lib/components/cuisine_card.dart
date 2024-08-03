import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CuisineCard extends StatelessWidget {
  final String assetPath;
  final String name;

  const CuisineCard({
    Key? key,
    required this.assetPath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Adjust shadow as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetPath, height: 50),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

