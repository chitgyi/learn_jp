import 'package:flutter/material.dart';
import 'package:learn_jp/Search/VocaSearch.dart';
import 'package:learn_jp/animation/PageAnimation.dart';
import 'package:learn_jp/components/chapter_item.dart';
import 'package:learn_jp/db/MoorHelper.dart';
import 'package:learn_jp/screens/VocaFavoriteList.dart';
import 'package:provider/provider.dart';

class Learn extends StatefulWidget {
  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  List<Chapter> chapter;

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDb>(context);
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).push(PageAnimation(child: VocaSearch())),
          child: Icon(Icons.search),
        ),
        body: _learn(db));
  }

  Widget _learn(var db) {
    db.allChapters.then((chapters) {
      setState(() {
        chapter = chapters;
      });
    });
    if (chapter == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (chapter.length > 0) {
      return ListView.builder(
        itemBuilder: (cxt, index) => ChapterItem(chapter[index]),
        itemCount: chapter.length,
      );
    } else {
      return Center(
        child: Text("Empty"),
      );
    }
  }
}
