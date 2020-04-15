import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/utils/Insert.dart';

class VocaDetailItem extends StatefulWidget {
  final Words words;
  final int index;

  VocaDetailItem(this.words, this.index);

  @override
  _VocaDetailItemState createState() => _VocaDetailItemState();
}

class _VocaDetailItemState extends State<VocaDetailItem> {
  bool isFav = false;
  @override
  void initState() {
    setState(() {
      isFav = widget.words.isFav != 0;
    });
    super.initState();
  }

  void setFav() {
    setState(() {
      isFav = !isFav;
    });
    Insert().updateKotobaFav(isFav, widget.words.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListBody(
        children: <Widget>[
          ListTile(
            title: Text(
              "${widget.index + 1}.${widget.words.hiragana}",
            ),
            subtitle: Text(
                "${widget.words.romaji}\n${widget.words.kanji}\n${widget.words.myanmar}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.zero,
                color: Colors.redAccent,
                icon: Icon(Icons.keyboard_voice),
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.zero,
                color: Colors.redAccent,
                icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                onPressed: setFav,
              )
            ],
          )
        ],
      ),
    );
  }
}
