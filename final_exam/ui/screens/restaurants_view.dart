import 'dart:ui_web';

import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../theme.dart';
import '../../models/restaurant_type.dart';
import 'restaurant_details.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = isChecked
        ? widget.restaurants
              .where((r) => r.type == RestaurantType.khmer)
              .toList()
        : widget.restaurants;

    Widget content = const Center(child: Text('No items added yet.'));

    if (filteredRestaurants.isNotEmpty) {
      content = ListView.builder(
        itemCount: filteredRestaurants.length,
        itemBuilder: (context, index) =>
            RestaurantTile(restaurant: filteredRestaurants[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text('Show only Khmer restaurants'),
              ],
            ),
          ),

          Expanded(child: content),
        ],
      ),
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantTile({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RestaurantDetailView(restaurant: restaurant),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                restaurant.address.toString(),
                style: TextStyle(color: Colors.grey[700]),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Chip(
                    avatar: const Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.amber,
                    ),
                    label: Text(
                      restaurant.comments
                          .map((c) => c.stars.toDouble())
                          .reduce((a, b) => a + b / 2)
                          .toString(),
                    ),
                  ),

                  const SizedBox(width: 8),

                  Chip(
                    label: Text(
                      restaurant.type.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: restaurant.type.color,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
