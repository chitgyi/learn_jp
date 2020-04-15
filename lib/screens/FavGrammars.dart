import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/components/grammar_item.dart';
import 'package:learn_jp/utils/Query.dart';

class FavGrammar extends StatefulWidget {

  @override
  _FavGrammarState createState() => _FavGrammarState();
}

class _FavGrammarState extends State<FavGrammar> {
  List<GrammarDAO> daos;
  @override
  void initState() {
    super.initState();
    Query().getFavGrammars().then((grammars) {
      setState(() {
        daos = grammars;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Grammars")),
      body: daos == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: daos.length,
              itemBuilder: (cxt, index) => GrammarItem(daos[index]),
            ),
    );
  }
}
