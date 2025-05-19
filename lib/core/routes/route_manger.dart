import 'package:flutter/material.dart';
import 'package:movie_app/presentation/main_layout/setting/setting.dart';

import '../../presentation/main_layout/all_movies_page/all_movies_page.dart';
import '../../presentation/main_layout/favorites_page/favorites_page.dart';
import '../../presentation/main_layout/main_layout.dart';
import '../../presentation/main_layout/movie_details_page/movie_details_page.dart';
import '../../presentation/main_layout/search_page/search_page.dart';
import '../../presentation/main_layout/setting/admin/add_movie/add_movie.dart';
import '../../presentation/main_layout/setting/admin/add_movie/movie_model.dart';
import '../../presentation/main_layout/setting/admin/admin_dashboard.dart';
import '../../presentation/main_layout/setting/admin/login_as_admin.dart';

class RouterManger {
  static const String mainLayout = '/MainLayout';
  static const String allMoviePage = '/AllMoviePage';
  static const String favoritesPage = '/FavoritesPage';
  static const String movieDetailsPage = '/MovieDetailsPage';
  static const String searchPage = '/SearchPage';
  static const String settingPage = '/SettingPage';
  static const String loginAsAdmin='/LoginAsAdmin';
  static const String adminDashboard = '/AdminDashboard';
  static const String addMovie = '/AddMovie';
  static const String movieModel = '/MovieModel';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainLayout:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case allMoviePage:
        return MaterialPageRoute(builder: (_) => AllMoviesPage());
      case favoritesPage:
        return MaterialPageRoute(builder: (_) => const FavoritesPage());
      case searchPage:
        return MaterialPageRoute(builder: (_) => SearchPage());
      case movieDetailsPage:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => const MovieDetailsPage(),
          settings: RouteSettings(arguments: args),
        );
        case settingPage:
          return MaterialPageRoute(builder: (_) => Setting());
          case loginAsAdmin:
          return MaterialPageRoute(builder: (_) => LoginAsAdmin());
      case adminDashboard:
        return MaterialPageRoute(builder: (_) =>  AdminDashboard());
        case addMovie:
        return MaterialPageRoute(builder: (_) =>  const AddMovie());
        case movieModel:
          return MaterialPageRoute(builder: (_) =>   MovieModel());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
