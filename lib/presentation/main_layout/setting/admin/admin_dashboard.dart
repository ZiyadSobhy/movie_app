import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/core/routes/route_manger.dart';
import 'package:movie_app/presentation/main_layout/setting/admin/widgets/card_move_without_fav.dart';
import '../../../../../provider/config_provider.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: ()  {
            Navigator.popAndPushNamed(context, RouterManger.mainLayout);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          Navigator.pushNamed(context, RouterManger.movieModel);
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<ConfigProvider>(
        builder: (context, configProvider, _) {
          final movies = configProvider.movies;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return CardMoveWithoutFav(movieDm: movies[index]);
            },
          );
        },
      ),
    );
  }
}
