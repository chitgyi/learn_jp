import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/words.dart';

class VocaDetailItem extends StatelessWidget {
  final Words words;
  final int index;

  VocaDetailItem(this.words, this.index);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListBody(
        children: <Widget>[
          ListTile(
            title: Text(
              "${index + 1}.${words.hiragana}",
            ),
            subtitle: Text("${words.romaji}\n${words.kanji}\n${words.myanmar}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.zero,
                color: Colors.redAccent,
                icon: Icon(Icons.keyboard_voice),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
