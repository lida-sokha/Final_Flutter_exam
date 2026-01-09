import 'package:flutter/material.dart';

import 'models/restaurant.dart';
import 'models/restaurant_type.dart';
import 'ui/screens/restaurants_view.dart';
import 'ui/theme.dart';
import 'models/restaurant_comment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.main,
      debugShowCheckedModeBanner: false,
      home: RestaurantsView(restaurants: allRestaurants),
    );
  }

  List<Restaurant> get allRestaurants {
    List<Restaurant> result = [
      Restaurant(
        name: 'Flutter Burger',
        address: 'Street 174, Phnom Penh',
        type: RestaurantType.khmer,
        comments: [
          RestaurantComment(stars: 4, feedback: 'Great food!'),
          RestaurantComment(stars: 5, feedback: 'Excellent service!'),
        ],
      ),

      Restaurant(
        name: 'Les croissants de Ronan',
        address: 'Sisowath Quay, Phnom Penh',
        type: RestaurantType.french,
        comments: [
          RestaurantComment(stars: 5, feedback: 'Delicious pastries!'),
          RestaurantComment(stars: 4, feedback: 'Lovely ambiance!'),
        ],
      ),

      Restaurant(
        name: 'La Pizza Del Ronano (the best)',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.italian,
        comments: [
          RestaurantComment(stars: 5, feedback: 'Delicious pastries!'),
          RestaurantComment(stars: 4, feedback: 'Lovely ambiance!'),
        ],
      ),

      Restaurant(
        name: 'Final Tacos',
        address: 'Street Exam, Phnom Penh',
        type: RestaurantType.mexican,
        comments: [
          RestaurantComment(stars: 5, feedback: 'Delicious pastries!'),
          RestaurantComment(stars: 4, feedback: 'Lovely ambiance!'),
        ],
      ),
      Restaurant(
        name: 'No money no Rice',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.streetfood,
        comments: [
          RestaurantComment(stars: 5, feedback: 'Delicious pastries!'),
          RestaurantComment(stars: 4, feedback: 'Lovely ambiance!'),
        ],
      ),

      Restaurant(
        name: 'Ronano the Besto',
        address: 'CADT, Phnom Penh',
        type: RestaurantType.khmer,
        comments: [
          RestaurantComment(stars: 5, feedback: 'Delicious pastries!'),
          RestaurantComment(stars: 4, feedback: 'Lovely ambiance!'),
        ],
      ),
    ];
    return result;
  }
}
