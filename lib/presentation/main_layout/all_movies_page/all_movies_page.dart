import 'package:flutter/material.dart';

import '../../../core/constant.dart';
import '../widgets/card_move.dart';

class AllMoviesPage extends StatelessWidget {
  AllMoviesPage({super.key});

  final List<MovieDm> movie = ConstantManager.movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Movies'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: movie.length,
        itemBuilder: (context, index) {
          return CardMove(movieDm: movie[index]);
        },
      ),
    );
  }
}
