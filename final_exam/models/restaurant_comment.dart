import 'package:flutter/material.dart';

enum Star { one, two, three, four, five }

class RestaurantComment {
  final int stars;
  final String feedback;

  RestaurantComment({required this.stars, required this.feedback});
}

