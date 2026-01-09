import 'package:flutter/material.dart';
import '../../models/restaurant.dart';
import '../../models/restaurant_comment.dart';
import '../screens/restaurant_comments_form.dart';

class RestaurantDetailView extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailView({super.key, required this.restaurant});

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView> {
  void _addComment(RestaurantComment comment) {
    setState(() {
      widget.restaurant.comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;

    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade100,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  restaurant.address.toString(),
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chip(
                      backgroundColor: restaurant.type.color,
                      label: Text(
                        restaurant.type.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      avatar: const Icon(Icons.star, color: Colors.amber),
                      label: Text(restaurant.stars.toString()),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Comments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: restaurant.comments.isEmpty
                ? const Center(child: Text('No comments yet'))
                : ListView.builder(
                    itemCount: restaurant.comments.length,
                    itemBuilder: (context, index) {
                      final c = restaurant.comments[index];
                      return ListTile(
                        title: Text(c.feedback),
                        trailing: Chip(
                          avatar: const Icon(Icons.star, color: Colors.amber),
                          label: Text(c.stars.toString()),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final comment = await showModalBottomSheet<RestaurantComment>(
            context: context,
            isScrollControlled: true,
            builder: (_) => const RestaurantCommentsForm(),
          );

          if (comment != null) {
            _addComment(comment);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
