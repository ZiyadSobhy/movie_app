import 'package:flutter/material.dart';
import '../../../core/constant.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late MovieDm movie;
  late bool isFavorite;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movie = ModalRoute.of(context)!.settings.arguments as MovieDm;
    isFavorite = FavoriteMovie.isFavorite(movie);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        FavoriteMovie.removeFromFavorites(movie);
      } else {
        FavoriteMovie.addToFavorites(movie);
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    String ratingText =
        movie.rating == 0.0 ? 'No Ratting' : movie.rating.toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              movie.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movie.title,
                style:  Theme.of(context).textTheme.bodyLarge
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movie.description,
                style:  Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 5),
                  Text(
                    'IMDb',
                    style:  Theme.of(context).textTheme.labelLarge
                  ),
                  const SizedBox(width: 5),
                  Text(
                    ratingText,
                    style: Theme.of(context).textTheme.bodyMedium
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    movie.hasOscar ? Icons.star : Icons.star_border,
                    color: movie.hasOscar ? Colors.yellow : Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    movie.hasOscar ? 'حاصل على جائزة أوسكار' : 'لم يحصل على أوسكار',
                    style:  Theme.of(context).textTheme.bodySmall
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            //
            // Center(
            //   child: ElevatedButton.icon(
            //     onPressed: toggleFavorite,
            //     icon: Icon(
            //       isFavorite ? Icons.favorite : Icons.favorite_border,
            //       color: Colors.white,
            //     ),
            //     label: Text(
            //       isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
            //     ),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: isFavorite ? Colors.red : Colors.blue,
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 24,
            //         vertical: 12,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
