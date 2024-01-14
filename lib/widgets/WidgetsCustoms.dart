import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
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

  Future<void> dialogBuilder(
      BuildContext context, String title, String description) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          content: Text(
            description,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
