// detail_dish_screen.dart

import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  final String title;

  const CategoriesScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Details for $title',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
