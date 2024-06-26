import 'package:flutter/material.dart';

class DishDetailsScreen extends StatelessWidget {
  final int dishId;
  final String dishName ;
  final double rating = 0.0 ;
  final double price = 0 ;
  final String imageUrl = 'assets/cheez.png' ;

  const DishDetailsScreen({
    Key? key,
    required this.dishId,
    required this.dishName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(dishName),
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.4, // 40% of the screen height
            width: double.infinity,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dishName,
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(
                          rating.toString(),
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add to order action with animation
                        final snackBar = SnackBar(
                          content: Text('$dishName added to order'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Green background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'Add to Order',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
