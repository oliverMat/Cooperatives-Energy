import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/personEntity');
    });

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Text("data"),
            ),
      ),
    );
  }
}
