import 'package:flutter/material.dart';
import '../../components/custom_search_bar.dart';
import './restaurant_card.dart';
import '../restaurantDetail/restaurant_detail_screen.dart';
import '../restaurants/restaurants_screen.dart';
import '../cuisines/cuisines.dart'; // Import the new screen
import '../../components/header.dart';
import '../../models/cuisine.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Restaurant {
  final String imageUrl;
  final String title;
  final int id;
  final double rating;
  final bool favorite;
  Restaurant({
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.rating,
    required this.favorite,
  });
}

class HomeScreen extends StatelessWidget {
  final List<Restaurant> popularRestaurants = [
     Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
        title: 'Restaurant 1',
        id: 1,
        rating: 4.5,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg',
        title: 'Restaurant 2',
        id: 2,
        rating: 3.8,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg',
        title: 'Restaurant 3',
        id: 3,
        rating: 4.0,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/1058277/pexels-photo-1058277.jpeg',
        title: 'Restaurant 4',
        id: 4,
        rating: 4.2,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/305236/pexels-photo-305236.jpeg',
        title: 'Restaurant 5',
        id: 5,
        rating: 4.7,
        favorite: true),
  ];

  final List<Restaurant> nearMeRestaurants = [
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
        title: ' Restaurant 1',
        id: 11,
        rating: 3.9,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
        title: ' Restaurant 2',
        id: 12,
        rating: 4.1,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg',
        title: ' Restaurant 3',
        id: 13,
        rating: 4.3,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg',
        title: ' Restaurant 4',
        id: 14,
        rating: 3.5,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/1058277/pexels-photo-1058277.jpeg',
        title: ' Restaurant 5',
        id: 15,
        rating: 4.6,
        favorite: true),
  ];

  final List<Restaurant> suggestedRestaurants = [
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
        title: 'Restaurant 1',
        id: 21,
        rating: 4.3,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
        title: 'Restaurant 2',
        id: 22,
        rating: 4.4,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
        title: 'Restaurant 3',
        id: 23,
        rating: 4.1,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg',
        title: 'Restaurant 4',
        id: 24,
        rating: 3.9,
        favorite: true),
    Restaurant(
        imageUrl:
            'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg',
        title: 'Restaurant 5',
        id: 25,
        rating: 4.5,
        favorite: true),
  ];

final List<Cuisine> cuisines = [
  Cuisine(
    svgIconPath: 'assets/burger.svg',
    name: 'American',
  ),
  Cuisine(
    svgIconPath: 'assets/burger.svg',
    name: 'Chinese',
  ),
  Cuisine(
    svgIconPath: 'assets/burger.svg',
    name: 'Indian',
  ),
  Cuisine(
    svgIconPath: 'assets/burger.svg', // Change to appropriate icon
    name: 'Mexican',
  ),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF5F5F5), // Updated background color
          padding: EdgeInsets.symmetric(vertical: 2.0), // Reduced vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                userName: 'John Doe',
                avatarUrl: '',
                onNotificationPressed: () {
                  // Handle notification press
                },
              ),
              CustomSearchBar(
                selectedItemColor: Color.fromARGB(255, 2, 165, 43),
                unselectedItemColor: Colors.black54,
              ),
              SizedBox(height: 4), // Reduced height
              buildCuisineSection(
                context,
                'Cuisines',
                cuisines,
              ),
              SizedBox(height: 4), // Reduced height
              buildRestaurantSection(
                context,
                'Popular Restaurants',
                popularRestaurants,
              ),
              SizedBox(height: 4), // Reduced height
              buildRestaurantSection(
                context,
                'Nearby',
                nearMeRestaurants,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRestaurantSection(
      BuildContext context, String title, List<Restaurant> restaurants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              8.0, 4.0, 8.0, 4.0), // Reduced padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllRestaurantsScreen(),
                    ),
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyle(color: Color.fromARGB(255, 49, 180, 1)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4), // Reduced height
        Container(
          height: 195,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 4.0 : 0.0,
                    right: 4.0), // Reduced padding
                child: RestaurantCard(
                  imageUrl: restaurant.imageUrl,
                  title: restaurant.title,
                  id: restaurant.id,
                  rating: restaurant.rating,
                  isFavorite: restaurant.favorite,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

Widget buildCuisineSection(
    BuildContext context, String title, List<Cuisine> cuisines) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllCuisinesScreen(cuisines: cuisines),
                  ),
                );
              },
              child: Text(
                'See All',
                style: TextStyle(color: Color.fromARGB(255, 49, 180, 1)),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 4), // Reduced height
      Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cuisines.length,
          itemBuilder: (context, index) {
            final cuisine = cuisines[index];
            return Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 4.0 : 0.0,
                  right: 4.0),
              child: Card(
                elevation: 4, // Adds shadow to the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                        child: SvgPicture.asset(
                          cuisine.svgIconPath,
                          height: 80,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 4), // Reduced height
                      Text(
                        cuisine.name,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
}
