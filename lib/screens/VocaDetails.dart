import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/MVP/LessonMVP.dart';
import 'package:learn_jp/components/styling.dart';

class VocaDetails extends StatefulWidget {
  final int id;
  VocaDetails(this.id);

  @override
  _VocaDetailsState createState() => _VocaDetailsState();
}

class _VocaDetailsState extends State<VocaDetails> implements LessonView {
  List<Words> word;

  @override
  void initState() {
    LessonPresenter(this).getWords(widget.id);
    super.initState();
  }

  @override
  void error(String err) {}

  @override
  void words(List<Words> words) {
    setState(() {
      word = words;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter ${widget.id + 1}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.more_vert),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 3),
        itemCount: word == null ? 0 : word.length,
        itemBuilder: (cxt, index) {
          return Card(
            elevation: 2,
            child: ListTile(
              title: Text(
                "${index + 1}.${word[index].hiragana}",
              ),
              subtitle: Text(
                  "${word[index].romaji}\n${word[index].kanji}\n${word[index].myanmar}"),
            ),
          );
        },
      ),
    );
  }
}