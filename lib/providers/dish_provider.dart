import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DishProvider with ChangeNotifier {
  String _name = '';
  String _description = '';
  List<String> _ingredients = [];
  double _price = 0.0;
  String _category = '';
  List<XFile> _images = [];

  String get name => _name;
  String get description => _description;
  List<String> get ingredients => _ingredients;
  double get price => _price;
  String get category => _category;
  List<XFile> get images => _images;

  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  void updateDescription(String description) {
    _description = description;
    notifyListeners();
  }

  void updateIngredients(List<String> ingredients) {
    _ingredients = ingredients;
    notifyListeners();
  }

  void addIngredient(String ingredient) {
    _ingredients.add(ingredient);
    notifyListeners();
  }

  void removeIngredient(String ingredient) {
    _ingredients.remove(ingredient);
    notifyListeners();
  }

  void updatePrice(double price) {
    _price = price;
    notifyListeners();
  }

  void updateCategory(String category) {
    _category = category;
    notifyListeners();
  }

  void addImage(XFile image) {
    if (_images.length < 4) {
      _images.add(image);
      notifyListeners();
    }
  }

  void removeImages() {
    _images.clear();
    notifyListeners();
  }
}
