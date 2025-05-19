import 'package:flutter/material.dart';

import '../core/constant.dart';

class ConfigProvider extends ChangeNotifier {
  bool hasOscar = false;
  List<MovieDm> movies = ConstantManager.movies;
  ThemeMode currentTheme = ThemeMode.light;

  bool get isDarkMode => currentTheme == ThemeMode.dark;

  bool get isHasOscar => hasOscar;

  void toggleOscar(bool? value) {
    hasOscar = value ?? false;
    notifyListeners();
  }

  void addMovie(MovieDm movie) {
    movies.add(movie);
    notifyListeners();
  }

  void deleteMovie(MovieDm movie) {
    movies.remove(movie);
    notifyListeners();
  }

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isNotExistMovie(String title) {
    for (int i = 0; i < movies.length; i++) {
      if (movies[i].title == title) {
        return false;
      }
    }
    return true;
  }
}
