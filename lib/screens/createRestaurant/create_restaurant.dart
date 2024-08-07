import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../providers/restaurant_provider.dart';
import '../../routes.dart'; // Import routes
import 'dart:io';

class RestaurantFormScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Restaurant'),
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
                'Restaurant Name',
                (value) => context.read<RestaurantProvider>().updateName(value),
              ),
              _buildTextField(
                context,
                'Location',
                (value) => context.read<RestaurantProvider>().updateLocation(value),
              ),
              _buildTextField(
                context,
                'Owner',
                (value) => context.read<RestaurantProvider>().updateOwner(value),
              ),
              _buildTextField(
                context,
                'Employees',
                (value) => context.read<RestaurantProvider>().updateEmployees(int.tryParse(value) ?? 0),
                keyboardType: TextInputType.number,
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
              Consumer<RestaurantProvider>(
                builder: (context, provider, child) {
                  return Wrap(
                    children: provider.restaurant.images.map((image) {
                      return Stack(
                        children: [
                          Image.file(File(image.path), width: 100, height: 100),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.remove_circle, color: Colors.red),
                              onPressed: () => provider.removeImage(image),
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
                  // Handle form submission
                },
                child: Text('Create Restaurant'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.dishFormRoute);
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

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final PermissionStatus status = await _requestPermission(source);
    if (status == PermissionStatus.granted) {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        context.read<RestaurantProvider>().addImage(image);
      }
    } else {
      // Handle permission denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission denied')),
      );
    }
  }

  Future<PermissionStatus> _requestPermission(ImageSource source) async {
    Permission permission;
    if (source == ImageSource.camera) {
      permission = Permission.camera;
    } else {
      permission = Permission.photos;
    }
    final status = await permission.request();
    return status;
  }
}
