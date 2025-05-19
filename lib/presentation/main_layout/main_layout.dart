import 'package:flutter/material.dart';
import 'package:movie_app/presentation/main_layout/search_page/search_page.dart';
import 'package:movie_app/presentation/main_layout/setting/setting.dart';

import 'all_movies_page/all_movies_page.dart';
import 'favorites_page/favorites_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      AllMoviesPage(),
      FavoritesPage(),
      SearchPage(),
      Setting(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (newIndex) {
        setState(() {
          currentIndex = newIndex;
        });
        setState(() {});
      },
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.all_inbox),
          label: 'All Movies',
          activeIcon: const Icon(Icons.all_inbox_outlined),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_border),
          label: 'Favorites Movies',
          activeIcon: const Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: 'Search',
          activeIcon: const Icon(Icons.search_off),
        ),

        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: 'setting',
          activeIcon: const Icon(Icons.settings_applications),
        ),
      ],
    );
  }
}
