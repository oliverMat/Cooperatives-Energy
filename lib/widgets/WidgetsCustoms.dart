import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WidgetsCustoms {
  AppBar appBar(BuildContext context, String text) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SvgPicture.asset(
          'assets/logo-amarelo.svg',
        ),
      ),
      title: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Text textSize25(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 25),
    );
  }
}
