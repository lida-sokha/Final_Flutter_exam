import 'package:flutter/material.dart';
import '../../models/restaurant_comment.dart';

class RestaurantCommentsForm extends StatefulWidget {
  const RestaurantCommentsForm({super.key});

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  final _formKey = GlobalKey<FormState>();

  int _selectedStars = 0;
  final _feedbackController = TextEditingController();

  void onAdd() {
    if (_formKey.currentState!.validate()) {
      final comment = RestaurantComment(
        stars: _selectedStars,
        feedback: _feedbackController.text,
      );

      Navigator.pop(context, comment);
    }
  }

  void onReset() {
    setState(() {
      _selectedStars = 0;
      _feedbackController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('How was your dinner?')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<int>(
                value: _selectedStars,
                decoration: const InputDecoration(
                  labelText: 'Rate the restaurant',
                ),
                items: List.generate(
                  6,
                  (index) => DropdownMenuItem(
                    value: index,
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Text(index.toString()),
                      ],
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedStars = value!;
                  });
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: _feedbackController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Feedback'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Feedback is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: onAdd,
                    child: const Text('Comment'),
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
