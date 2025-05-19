import 'package:flutter/material.dart';
import '../../../../../core/routes/route_manger.dart';

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
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, RouterManger.movieModel);
        }, child: Text('Add Movie')),
      )
    );
  }
}
