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
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final ratingController = TextEditingController();
  File? imageFile;
  final picker = ImagePicker();
  String? ratingError;

  void pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void submitForm() {
    final configProvider = Provider.of<ConfigProvider>(context, listen: false);
    final title = titleController.text.trim();
    final desc = descriptionController.text.trim();
    final ratingText = ratingController.text.trim();
// try ensure this value is good to use
    double? rating = double.tryParse(ratingText);
    setState(() {
      ratingError = null;
    });

    if (rating == null || rating > 10 || rating < 0) {
      setState(() {
        ratingError = "Rating must be a number between 0 and 10";
      });
      return;
    }

    if (title.isNotEmpty &&
        desc.isNotEmpty &&
        configProvider.isNotExistMovie(title)) {
      configProvider.addMovie(
        MovieDm(
          title: title,
          description: desc,
          rating: rating,
          imageUrl: imageFile?.path ?? AssetsManger.inception,
          hasOscar: configProvider.hasOscar,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields and ensure the movie doesn't already exist.",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Movie")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                decoration: InputDecoration(
                  labelText: "Rating",
                  errorText: ratingError,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: configProvider.hasOscar,
                    onChanged: (value) => configProvider.toggleOscar(value),
                  ),
                  Text(
                    "Has Oscar",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: pickImage,
                icon: const Icon(Icons.image),
                label: const Text("Pick Image"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: submitForm,
                child: const Text("Add Movie"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
