import 'restaurant_type.dart';
import 'restaurant_comment.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<RestaurantComment> comments;

  var stars = 5;

  Restaurant({
    required this.name,
    required this.address,
    required this.type,
    required this.comments,
  });
}
