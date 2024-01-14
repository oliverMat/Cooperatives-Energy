import 'package:cooperatives_energy/view/OffersScreen.dart';
import 'package:flutter/material.dart';

import 'view/InfoScreen.dart';
import 'view/SplashScreen.dart';

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
    initialRoute: '/infoScreen',
    routes: {
      '/splashScreen': (context) => const SplashScreen(),
      '/infoScreen': (context) => const InfoScreen(),
      '/offersScreen': (context) => const OffersScreen(),
    },
  ));
}
