import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/dish_provider.dart';
import '../../models/dish.dart';
import 'dart:io';

class DishFormScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Dish'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 20),
              _buildTextField(
                context,
                'Dish Name',
                (value) => context.read<DishProvider>().updateName(value),
              ),
              _buildTextField(
                context,
                'Description',
                (value) => context.read<DishProvider>().updateDescription(value),
              ),
              _buildTextField(
                context,
                'Ingredients',
                (value) => _addIngredient(context, value),
              ),
              _buildTextField(
                context,
                'Price',
                (value) => _updatePrice(context, value),
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                context,
                'Category',
                (value) => context.read<DishProvider>().updateCategory(value),
              ),
              SizedBox(height: 20),
              Text('Upload Images'),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(context, ImageSource.camera),
                    child: Text('Take Picture'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _pickImage(context, ImageSource.gallery),
                    child: Text('Choose from Gallery'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Consumer<DishProvider>(
                builder: (context, provider, child) {
                  return Wrap(
                    children: provider.images.map((image) {
                      return Stack(
                        children: [
                          Image.file(File(image.path), width: 100, height: 100),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.remove_circle, color: Colors.red),
                              onPressed: () => context.read<DishProvider>().removeImages(),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _createDish(context);
                },
                child: Text('Create Dish'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String label,
    Function(String) onChanged, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }

  void _addIngredient(BuildContext context, String value) {
    if (value.isNotEmpty) {
      context.read<DishProvider>().addIngredient(value);
      _ingredientController.clear();
    }
  }

  void _updatePrice(BuildContext context, String value) {
    double price = double.tryParse(value) ?? 0.0;
    context.read<DishProvider>().updatePrice(price);
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      context.read<DishProvider>().addImage(image);
    }
  }

  void _createDish(BuildContext context) {
    DishProvider dishProvider = context.read<DishProvider>();
    Dish newDish = Dish(
      name: dishProvider.name,
      description: dishProvider.description,
      ingredients: dishProvider.ingredients,
      price: dishProvider.price,
      category: dishProvider.category,
      images: dishProvider.images.map((image) => image.path).toList(),
    );

    // Perform any additional actions, such as submitting to a database

    // Clear form fields and reset state
    dishProvider.updateName('');
    dishProvider.updateDescription('');
    dishProvider.updateIngredients([]);
    dishProvider.updatePrice(0.0);
    dishProvider.updateCategory('');
    dishProvider.removeImages();
  }
}
