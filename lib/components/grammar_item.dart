import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/grammar.dart';

class GrammarItem extends StatefulWidget {
  final GrammarDAO grammarDAO;
  GrammarItem(this.grammarDAO);

  @override
  _GrammarItemState createState() => _GrammarItemState();
}

class _GrammarItemState extends State<GrammarItem> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isFav = widget.grammarDAO.grammarFav.isFav;
    });
  }

  setFav() {
    setState(() {
      isFav = !isFav;
    });
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
