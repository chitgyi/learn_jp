import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/components/grammar_item.dart';

class Grammar extends StatelessWidget {
  final int chapterId;
  Grammar(this.chapterId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grammar")),
      body: ListView.builder(
        itemCount: grammarList.length,
        itemBuilder: (cxt, index) => GrammarItem(grammarList[index]),
      ),
    );
  }
}
