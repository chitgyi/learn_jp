import 'package:flutter/material.dart';
import 'package:learn_jp/components/choose_item.dart';

class Exercise extends StatelessWidget {
  final questions = {
    "choose": [
      {"A": "と"},
      {"B": "に"},
      {"C": "は"},
      {"D": "で"}
    ],
    "title": "でも、言(い)いたいこ___は自由(じゆう)に言(い)わせます。",
    "answer": "A"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: Text("Exercises"),
          titleSpacing: 0,
        ),
        body: CustomRadio(questions),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.grey,
                onPressed: () {},
                child: Icon(Icons.navigate_before),
              ),
              FloatingActionButton(
                heroTag: null,
                onPressed: () {},
                child: Icon(Icons.navigate_next),
              )
            ],
          ),
        ));
  }
}
