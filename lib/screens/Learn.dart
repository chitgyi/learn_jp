import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/MVP/VocaMVP.dart';
import 'package:learn_jp/Search/VocaSearch.dart';
import 'package:learn_jp/animation/PageAnimation.dart';
import 'package:learn_jp/components/chapter_item.dart';
import 'package:learn_jp/screens/FavGrammars.dart';
import 'package:learn_jp/screens/VocaFavoriteList.dart';

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
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("Learn"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context)
                  .push(PageAnimation(child: VocaFavoriteList()));
            },
          ),
          IconButton(
            icon: Icon(Icons.library_books),
            onPressed: () {
              Navigator.of(context).push(PageAnimation(child: FavGrammar()));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).push(PageAnimation(child: VocaSearch())),
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
