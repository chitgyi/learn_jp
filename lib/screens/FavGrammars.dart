import 'package:flutter/material.dart';
import 'package:learn_jp/components/grammar_item.dart';
import 'package:learn_jp/utils/Query.dart';

class FavGrammar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Favorite Grammars")),
        body: FutureBuilder(
          future: Queries().getFavGrammar(),
          builder: (cxt, snap) {
            var data = snap.data as List;
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snap.data == null || data.length < 1) {
              return Center(child: Text("Empty Favorite"));
            }
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (cxt, index) => GrammarItem(data[index]),
            );
          },
        ));
  }
}
