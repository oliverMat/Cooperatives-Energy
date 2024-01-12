import 'package:cooperatives_energy/Person.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  final Person? person;

  const OffersScreen({Key? key, this.person}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Text(widget.person!.name)
        ],
      )),
    );
  }
}
