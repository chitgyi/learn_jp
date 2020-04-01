import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/MVP/LessonMVP.dart';

class LessonPage extends StatefulWidget {
  final int id;
  LessonPage(this.id);

  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> implements LessonView {
  List<Words> word;

  @override
  void initState() {
    
    LessonPresenter(this).getWords(widget.id);
    super.initState();
  }

  @override
  void error(String err) {
    
  }

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
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(7)),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "${index+1}. ${word[index].hiragana} \n${word[index].romaji}\n${word[index].myanmar}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
