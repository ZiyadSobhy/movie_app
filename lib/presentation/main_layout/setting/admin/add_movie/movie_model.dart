import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/assets_manger.dart';
import '../../../../../provider/config_provider.dart';
import '../../../../../core/constant.dart';

class MovieModel extends StatefulWidget {
  const MovieModel({super.key});

  @override
  State<MovieModel> createState() => _MovieModelState();
}

class _MovieModelState extends State<MovieModel> {
  File? _imageFile;
  final picker = ImagePicker();

  void _showAddMovieBottomSheet(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final ratingController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add New Movie",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: ratingController,
                  decoration: const InputDecoration(labelText: "Rating"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Consumer<ConfigProvider>(
                      builder: (context, configProvider, _) {
                        return Checkbox(
                          value: configProvider.hasOscar,
                          onChanged: configProvider.toggleOscar,
                        );
                      },
                    ),
                    Text(
                      "Has Oscar",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final pickedFile = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        _imageFile = File(pickedFile.path);
                      });
                    }
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("Pick Image"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final configProvider =
                    Provider.of<ConfigProvider>(context, listen: false);

                    final title = titleController.text.trim();
                    final desc = descriptionController.text.trim();
                    final rating =
                        double.tryParse(ratingController.text) ?? 0.0;

                    if (title.isNotEmpty && desc.isNotEmpty) {
                      configProvider.addMovie(
                        MovieDm(
                          id: DateTime.now().toString(),
                          title: title,
                          description: desc,
                          rating: rating,
                          imageUrl: _imageFile?.path ??
                              AssetsManger.inception, // default image
                          hasOscar: configProvider.hasOscar,
                        ),
                      );
                      Navigator.pop(ctx);
                      _imageFile = null;
                    }
                  },
                  child: const Text("Add Movie"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showAddMovieBottomSheet(context),
        child: const Text("Add Movie (Admin)"),
      ),
    );
  }
}
