import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/utils/DbHelper.dart';
import 'package:learn_jp/utils/Insert.dart';

class GrammarItem extends StatefulWidget {
  final GrammarDAO grammarDAO;
  GrammarItem(this.grammarDAO);

  @override
  _GrammarItemState createState() => _GrammarItemState();
}

class _GrammarItemState extends State<GrammarItem> {
  bool isFav = false;
  final db = DbHelper.access();

  @override
  void initState() {
    super.initState();
    
    setState(() {
      isFav = widget.grammarDAO.grammarForm.isFav != 0;
    });
  }

  setFav() async {
    setState(() {
      isFav = !isFav;
    });
    await Insert()
        .updateFav(isFav: isFav, id: widget.grammarDAO.grammarForm.id);
    //  grammarList.forEach((f) => db.insertGrammar(f));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
              title: Text(
                widget.grammarDAO.grammarForm.title,
              ),
              subtitle: Text(
                  "${widget.grammarDAO.grammarForm.hiragana}\n${widget.grammarDAO.grammarForm.romaji}\n${widget.grammarDAO.grammarForm.myanmar}")),
          ListTile(
            title: Text(
              "Examples",
            ),
            subtitle: Column(
              children: widget.grammarDAO.grammarEg
                  .map((f) => Text("${f.hiragana}\n${f.romaji}\n${f.myanmar}"))
                  .toList(),
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                color: Colors.redAccent,
                icon: Icon(this.isFav ? Icons.favorite : Icons.favorite_border),
                onPressed: setFav,
              )
            ],
          )
        ],
      ),
    );
  }
}
