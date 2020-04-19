import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:learn_jp/DAO/accessvoca.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/MVP/LessonMVP.dart';
import 'package:learn_jp/components/voca_deatail_item.dart';

class VocaDetails extends StatefulWidget {
  final int id;
  VocaDetails(this.id);

  @override
  _VocaDetailsState createState() => _VocaDetailsState();
}

class _VocaDetailsState extends State<VocaDetails> implements LessonView {
  List<Words> word;
  AccessVoca accessVoca = AccessVoca();

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
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        titleSpacing: 0,
        title: ListTile(
          title: Text(
            "Vocabulary",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Chapter ${widget.id + 1}",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0.5,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.check_box_outline_blank),
            backgroundColor: Colors.amber,
            label: 'Kanji',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                accessVoca.showKanji = !accessVoca.showKanji;
              });
            },
          ),
          SpeedDialChild(
              child: Icon(Icons.accessibility),
              backgroundColor: Colors.red,
              label: 'Romaji',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                setState(() {
                  accessVoca.showRomaji = !accessVoca.showRomaji;
                });
              }),
          SpeedDialChild(
            child: Icon(Icons.hdr_weak),
            backgroundColor: Colors.green,
            label: 'Hiragana',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                accessVoca.showHiragna = !accessVoca.showHiragna;
              });
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.language),
            backgroundColor: Colors.blue,
            label: 'Mynamar',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                accessVoca.showMyanmar = !accessVoca.showMyanmar;
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 3),
        itemCount: word == null ? 0 : word.length,
        itemBuilder: (cxt, index) => VocaDetailItem(
          words: word[index],
          index: index,
          accessVoca: accessVoca,
        ),
      ),
    );
  }
}
