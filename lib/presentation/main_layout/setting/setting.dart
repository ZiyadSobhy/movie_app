import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/route_manger.dart';
import 'package:provider/provider.dart';

import '../../../provider/config_provider.dart';

class Setting extends StatelessWidget {
  Setting({super.key});

  final List<String> themeModeList = ['Light', 'Dark'];
  late ConfigProvider configProvider;

  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);

    String currentTheme =
        configProvider.currentTheme == ThemeMode.dark ? 'Dark' : 'Light';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterManger.loginAsAdmin);
              },
              child: const Text('Login As Admin'),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color:
                    Theme.of(
                      context,
                    ).bottomNavigationBarTheme.selectedItemColor,
                borderRadius: BorderRadius.circular(16),
              ),

              child: DropdownButton<String>(
                icon: const Icon(Icons.arrow_drop_down ,color: Colors.white),
               dropdownColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                underline: SizedBox(),
                isExpanded: true,
                iconSize: 30,
                value: currentTheme,
                items:
                    themeModeList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      );
                    }).toList(),
                onChanged: onThemeChange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onThemeChange(String? newTheme) {
    if (newTheme != null) {
      configProvider.changeAppTheme(
        newTheme == 'Dark' ? ThemeMode.dark : ThemeMode.light,
      );
    }
  }
}
