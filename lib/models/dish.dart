import 'dart:io';

class Dish {
  final String name;
  final String description;
  final List<String> ingredients;
  final double price;
  final String category;
  final List<String> images;
  final bool favorite; // New field for favorite status

  Dish({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.price,
    required this.category,
    required this.images,
    this.favorite = false, // Default value is false
  });
}
