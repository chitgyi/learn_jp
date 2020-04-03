import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/MVP/VocaMVP.dart';
import 'package:learn_jp/Search/VocaSearch.dart';
import 'package:learn_jp/components/chapter_item.dart';

class Learn extends StatefulWidget {
  const Learn({Key key}) : super(key: key);

  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> implements VocaView {
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
        title: Text("Learn"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (cxt) => VocaSearch())),
        child: Icon(Icons.search),
      ),
      body: vocas == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: vocas.length,
              itemBuilder: (cxt, index) => ChapterItem(vocas[index]),
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
