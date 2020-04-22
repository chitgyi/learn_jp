import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/components/grammar_item.dart';
import 'package:learn_jp/utils/Query.dart';

class Grammar extends StatelessWidget {
  final int chapterId;
  Grammar(this.chapterId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: ListTile(
            title: Text(
              "Grammar",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Chapter ${chapterId + 1}",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ),
        body: FutureBuilder(
          future: Queries().getGrammar(chapterId + 1),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                var grammars = snapshot.data as List;
                if (grammars.length < 1) {
                  return Center(
                    child: Text("Grammar is Empty"),
                  );
                }
                return _showGrammar(grammars);
                break;
              case ConnectionState.none:
                return FutureBuilder(
                  future: Queries().getGrammar(chapterId),
                  builder: (cxt, snap) {
                    var grammar = snap.data as List;
                    if (grammar.length < 1) {
                      return _showGrammar(grammar);
                    }
                    return Center(
                      child: Text("Grammar is Empty"),
                    );
                  },
                );
                break;

              default:
                return Center(
                  child: Text("Grammar is Empty~"),
                );
            }
          },
        ));
  }

  Widget _showGrammar(List<GrammarDAO> grammars) {
    return ListView.builder(
      itemCount: grammars.length,
      itemBuilder: (cxt, index) => GrammarItem(grammars[index]),
    );
  }
}
