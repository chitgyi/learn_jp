import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/MVP/VocaMVP.dart';
import 'package:learn_jp/components/chapter_item.dart';

class Voca extends StatefulWidget {
  const Voca({Key key}) : super(key: key);

  @override
  _VocaState createState() => _VocaState();
}

class _VocaState extends State<Voca> implements VocaView {
  List<Chapter> vocas;

  @override
  void initState() {
    VocaPresenter(this).getChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voca"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
      ),
      body: vocas == null ? Center(child: CircularProgressIndicator()) : GridView.count(
       crossAxisCount: 3,
       children: vocas.map((f)=>ChapterItem(f)).toList(),
      ),
    );
  }

  @override
  void chapters(List<Chapter> chapter) {
    setState(() {
      vocas = chapter;
    });
  }

  @override
  void error(String err) {}
}
