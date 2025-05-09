import 'package:movie_app/core/resources/assets_manger.dart';

class MovieDm {
  String id;
  final String title;
  final String imageUrl;
  final String description;
  final double rating;
  final bool hasOscar;

  MovieDm({
     this.id='0',
    required this.title,
    required this.imageUrl,
    required this.description,
    this.rating = 0.0,
    this.hasOscar = false,
  });
}

class ConstantManager {
  static List<MovieDm> movies = [
    MovieDm(
      id: '1',
      title: 'Inception',
      description:
      'فيلم خيال علمي عن الأحلام داخل الأحلام، من إخراج كريستوفر نولان.',
      imageUrl: AssetsManger.inception,
      rating: 8.8,
      hasOscar: false,
    ),
    MovieDm(
      id: '2',
      title: 'The Dark Knight',
      description:
      'باتمان يواجه الجوكر في واحدة من أفضل أفلام الأبطال الخارقين.',
      imageUrl: AssetsManger.darkKnight,
      rating: 9.0,
      hasOscar: false,
    ),
    MovieDm(
      id: '3',
      title: 'Interstellar',
      description: 'رحلة إلى الفضاء لإنقاذ البشرية، فيلم فلسفي وعلمي عميق.',
      imageUrl: AssetsManger.interstellar,
      rating: 8.6,
      hasOscar: true,
    ),
    MovieDm(
      id: '4',
      title: 'Avengers: Endgame',
      description: 'ختام ملحمي لسلسلة مارفل، معركة مصيرية ضد ثانوس.',
      imageUrl: AssetsManger.endgame,
      rating: 8.4,
      hasOscar: false,
    ),
    MovieDm(
      id: '5',
      title: 'Joker',
      description: 'رحلة التحول النفسي لرجل يعاني من المجتمع إلى رمز للفوضى.',
      imageUrl: AssetsManger.joker,
      rating: 8.5,
      hasOscar: true,
    ),
    MovieDm(
      id: '6',
      title: 'Parasite',
      description: 'فيلم كوري درامي ساخر، يعرض الفوارق الطبقية بطريقة ذكية.',
      imageUrl: AssetsManger.parasite,
      rating: 8.6,
      hasOscar: true,
    ),
    MovieDm(
      id: '7',
      title: 'Fight Club',
      description: 'رحلة في أعماق العقل والهوية والتمرد ضد الرأسمالية.',
      imageUrl: AssetsManger.fightClub,
      rating: 8.8,
      hasOscar: false,
    ),
    MovieDm(
      id: '8',
      title: 'The Matrix',
      description: 'هل الواقع حقيقي؟ فيلم غير مفاهيم الخيال العلمي في السينما.',
      imageUrl: AssetsManger.theMatrix,
      rating: 8.7,
      hasOscar: false,
    ),
    MovieDm(
      id: '9',
      title: 'Forrest Gump',
      description: 'قصة رجل بسيط عايش لحظات مهمة من تاريخ أمريكا.',
      imageUrl: AssetsManger.forrestGump,
      rating: 8.8,
      hasOscar: true,
    ),
    MovieDm(
      id: '10',
      title: 'The Godfather',
      description: 'قصة عائلة مافيا، من أقوى أفلام الجريمة في التاريخ.',
      imageUrl: AssetsManger.goodFather,
      rating: 9.2,
      hasOscar: true,
    ),
  ];
}

class FavoriteMovie {
  static List<MovieDm> favoriteMovies = [];

  static void addToFavorites(MovieDm movie) {
    favoriteMovies.add(movie);
  }

  static void removeFromFavorites(MovieDm movie) {
    favoriteMovies.remove(movie);
  }

  static bool isFavorite(MovieDm movie) {
    return favoriteMovies.contains(movie);
  }
}
