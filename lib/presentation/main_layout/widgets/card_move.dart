import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/route_manger.dart';
import '../../../core/constant.dart';

class CardMove extends StatefulWidget {
  const CardMove({super.key, required this.movieDm});

  final MovieDm movieDm;

  @override
  State<CardMove> createState() => _CardMoveState();
}

class _CardMoveState extends State<CardMove> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = FavoriteMovie.isFavorite(widget.movieDm);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouterManger.movieDetailsPage,
          arguments: widget.movieDm,
        );
      },
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  // Unable to load asset: "/data/user/0/com.example.movie_app/cache/..."
                  widget.movieDm.imageUrl.contains("/data/")
                      ? Image.file(
                        File(widget.movieDm.imageUrl),
                        fit: BoxFit.cover,
                      )
                      : Image.asset(widget.movieDm.imageUrl, fit: BoxFit.cover),
            ),
          ),
          title: Text(
            widget.movieDm.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.movieDm.description),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                if (isFavorite) {
                  FavoriteMovie.removeFromFavorites(widget.movieDm);
                } else {
                  FavoriteMovie.addToFavorites(widget.movieDm);
                }
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
