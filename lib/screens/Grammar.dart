import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/components/grammar_item.dart';

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
              "Chapter $chapterId",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ),
        body: FutureBuilder(
          future: Firestore.instance
              .collection("grammars")
              .where("chapter", isEqualTo: chapterId)
              .getDocuments(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var docs = snapshot.data as QuerySnapshot;
                  var grammars = docs.documents
                      .map((f) => GrammarData.fromSnapshot(f))
                      .toList();
                  if (grammars.length > 0) {
                    return _showGrammar(grammars);
                  } else {
                    return Center(child: Text("Empty"));
                  }
                } else {
                  return Center(
                    child: Text("Empty"),
                  );
                }
                break;
              default:
                return Center(
                  child: IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {},
                  ),
                );
            }
          },
        ));
  }

  Widget _showGrammar(List<GrammarData> grammars) {
    return ListView.builder(
      itemCount: grammars.length,
      itemBuilder: (cxt, index) => GrammarItem(grammars[index]),
    );
  }
}
