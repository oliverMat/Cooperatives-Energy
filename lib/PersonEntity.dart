import 'package:flutter/material.dart';

class PersonEntity extends StatefulWidget {
  const PersonEntity({Key? key}) : super(key: key);

  @override
  State<PersonEntity> createState() => _PersonEntityState();
}

class _PersonEntityState extends State<PersonEntity> {

  late final List<bool> isSelected = <bool>[false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ToggleButtons(
          fillColor: Colors.black38,
          selectedBorderColor: Colors.green[700],
          isSelected: isSelected,
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          children: const <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Row(children: [
                  Icon(Icons.ac_unit),
                  Text("Fisica")
                ],)
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(children: [
                Icon(Icons.call),
                Text("Juridica")
              ],),
            )
          ],
        ),
      ),
    );
  }
}
