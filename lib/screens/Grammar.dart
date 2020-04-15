import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/components/grammar_item.dart';
import 'package:learn_jp/utils/Query.dart';

class Grammar extends StatefulWidget {
  final int chapterId;
  Grammar(this.chapterId);

  @override
  _GrammarState createState() => _GrammarState();
}

class _GrammarState extends State<Grammar> {
  List<GrammarDAO> daos;
  @override
  void initState() {
    super.initState();
    Query().getGrammars(widget.chapterId).then((grammars) {
      setState(() {
        daos = grammars;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: ListTile(
          title: Text(
            "Grammar",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Chapter ${widget.chapterId + 1}",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
      body: daos == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: daos.length,
              itemBuilder: (cxt, index) => GrammarItem(daos[index]),
            ),
    );
  }
}
