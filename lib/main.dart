import 'package:flutter/material.dart';
import 'package:movie_app/provider/config_provider.dart';
import 'package:provider/provider.dart';

import 'movie_app.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ConfigProvider(),
      child: const MovieApp()));
}


