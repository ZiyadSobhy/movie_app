import 'package:flutter/material.dart';
import 'movie_model.dart';

class AddMovie extends StatelessWidget {
  const AddMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie'),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MovieModel(),
    );
  }
}
