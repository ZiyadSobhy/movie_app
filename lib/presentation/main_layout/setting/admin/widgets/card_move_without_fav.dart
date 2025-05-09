import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant.dart';
import '../../../../../core/routes/route_manger.dart';
import '../../../../../provider/config_provider.dart';

class CardMoveWithoutFav extends StatelessWidget {
  const CardMoveWithoutFav({super.key, required this.movieDm});

  final MovieDm movieDm;

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouterManger.movieDetailsPage,
          arguments: movieDm,
        );
      },
      child: Card(
        child: ListTile(
          leading: SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: movieDm.imageUrl.contains("/data/")
                  ? Image.file(
                File(movieDm.imageUrl),
                fit: BoxFit.cover,
              )
                  : Image.asset(
                movieDm.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(movieDm.title),
          subtitle: Text(movieDm.description),
          trailing: IconButton(
            onPressed: () {
              configProvider.deleteMovie(movieDm);
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
