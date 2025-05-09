import 'package:flutter/material.dart';
import 'package:movie_app/provider/config_provider.dart';
import 'package:provider/provider.dart';

import 'config/theme/theme_manger.dart';
import 'core/routes/route_manger.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return MaterialApp(
      initialRoute: RouterManger.mainLayout,
      onGenerateRoute: RouterManger.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeManger.light,
      darkTheme: ThemeManger.dark,
      themeMode: configProvider.currentTheme,

    );
  }
}
