import 'package:flutter/material.dart';

class Kanji extends StatelessWidget {
  const Kanji({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kanji"),
        titleSpacing: 0,
      ),
    );
  }
}
