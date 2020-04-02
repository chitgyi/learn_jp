import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/chapter.dart';

class ChapterItem extends StatelessWidget {
  final Chapter chapter;
  ChapterItem(this.chapter);

  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: <Widget>[
      ListTile(title: Text("Chapter ${chapter.id+1}"),)
    ],),);
  }
}
