import 'package:flutter/material.dart';

import 'PersonEntity.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    initialRoute: '/splash',
    routes: {
      '/splash': (context) => const SplashScreen(),
      '/personEntity': (context) => const PersonEntity(),
    },
  ));
}
