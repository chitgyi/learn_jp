import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/accessvoca.dart';
import 'package:learn_jp/db/MoorHelper.dart';

class VocaDetailItem extends StatefulWidget {
  final Kotoba kotoba;
  final int index;
  final AccessVoca accessVoca;

  VocaDetailItem({this.kotoba, this.index, this.accessVoca});

  @override
  _VocaDetailItemState createState() => _VocaDetailItemState();
}

class _VocaDetailItemState extends State<VocaDetailItem> {
  bool isFav = false;
  @override
  void initState() {
    setState(() {
      isFav = widget.kotoba.isFav != 0;
    });
    super.initState();
  }

  void setFav() {
    setState(() {
      isFav = !isFav;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListBody(
        children: <Widget>[
          ListTile(
            title: Text(_showText()),
            subtitle: Text(_showSubText()),
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

  String _showText() {
    if (!widget.accessVoca.showHiragna &&
        !widget.accessVoca.showRomaji &&
        !widget.accessVoca.showKanji &&
        !widget.accessVoca.showMyanmar) {
      return '${widget.index + 1}. ${widget.kotoba.hiragana}';
    }
    return widget.accessVoca.showHiragna
        ? "${widget.index + 1}. ${widget.kotoba.hiragana}"
        : "";
  }

  String _showSubText() {
    return (widget.accessVoca.showRomaji ? widget.kotoba.romaji : "") +
        "\n" +
        (widget.accessVoca.showKanji ? widget.kotoba.kanji : "") +
        "\n" +
        (widget.accessVoca.showMyanmar ? widget.kotoba.myanmar : "");
  }
}
