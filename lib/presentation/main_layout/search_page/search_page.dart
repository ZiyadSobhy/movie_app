import 'package:flutter/material.dart';

import '../../../core/constant.dart';
import '../widgets/card_move.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<MovieDm> filteredMovies = [];
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (inputText) {
                setState(() {
                  searchText = inputText;
                  filteredMovies =
                      ConstantManager.movies
                          .where(
                            (movie) => movie.title.toLowerCase().contains(
                              searchText.toLowerCase(),
                            ),
                          )
                          .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child:
                searchText.isEmpty
                    ? const SizedBox()
                    : filteredMovies.isEmpty
                    ?  Center(
                      child: Text(
                        'No results found',
                        style: Theme.of(context).textTheme.bodyLarge
                      ),
                    )
                    : ListView.builder(
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        return CardMove(movieDm: filteredMovies[index]);
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
