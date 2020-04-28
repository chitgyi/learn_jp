import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/grammar.dart';

class GrammarItem extends StatelessWidget {
  final GrammarData grammarData;
  GrammarItem(this.grammarData);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: <Widget>[
            ListTile(
                title: Text(
                  grammarData.title,
                ),
                subtitle:
                    Text("${grammarData.hiragana}\n${grammarData.myanmar}")),
            grammarData.note == ""
                ? Container()
                : ListTile(
                    title: Text(
                      "Note",
                    ),
                    subtitle: Text("${grammarData.note}")),
            ListTile(
              title: Text(
                "Examples",
              ),
              subtitle: Column(
                children: grammarData.example
                    .map((f) => Text("${f['hiragana']}\n${f['myanmar']}"))
                    .toList(),
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
