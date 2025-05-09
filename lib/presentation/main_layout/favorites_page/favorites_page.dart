import 'package:flutter/material.dart';

import '../../../core/constant.dart';
import '../widgets/card_move.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MovieDm> favorites = FavoriteMovie.favoriteMovies;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Movies'),
        automaticallyImplyLeading: false,
      ),
      body:
          favorites.isEmpty
              ? Center(
                child: Text(
                  'Is  List empty!',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              )
              : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return CardMove(movieDm: favorites[index]);
                },
              ),
    );
  }
}
