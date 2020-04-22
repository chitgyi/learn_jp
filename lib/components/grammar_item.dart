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
      isFav = widget.grammarDAO.isFav == 1;
    });
    print(widget.grammarDAO.isFav);
  }

  setFav() async {
    setState(() {
      isFav = !isFav;
    });
    widget.grammarDAO.isFav = isFav ? 1 : 0;
    await Insert().updateFav(widget.grammarDAO);
    print(widget.grammarDAO.isFav);
    //  grammarList.forEach((f) => db.insertGrammar(f));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
              title: Text(
                widget.grammarDAO.title,
              ),
              subtitle: Text(
                  "${widget.grammarDAO.hiragana}\n${widget.grammarDAO.myanmar}")),
          ListTile(
            title: Text(
              "Examples",
            ),
            subtitle: Column(
              children: widget.grammarDAO.eg
                  .map((f) => Text("${f['hiragana']}\n${f['myanmar']}"))
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
