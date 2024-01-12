import 'package:flutter/material.dart';

import 'InfoScreen.dart';
import 'OffersScreen.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Colors.black,
        secondary: Colors.grey,
        onSecondary: Colors.grey,
        background: Color(0xFF00303F),
        onBackground: Colors.grey,
        surface: Colors.grey,
        onSurface: Colors.grey,
        error: Colors.red,
        onError: Colors.red,
      ),
    ),
    initialRoute: '/splashScreen',
    routes: {
      '/splashScreen': (context) => const SplashScreen(),
      '/infoScreen': (context) => const InfoScreen(),
      '/offersScreen': (context) => const OffersScreen(),
    },
  ));
}
