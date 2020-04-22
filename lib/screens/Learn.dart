import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/MVP/VocaMVP.dart';
import 'package:learn_jp/Search/VocaSearch.dart';
import 'package:learn_jp/animation/PageAnimation.dart';
import 'package:learn_jp/components/chapter_item.dart';
import 'package:learn_jp/screens/FavGrammars.dart';
import 'package:learn_jp/screens/VocaFavoriteList.dart';
import 'package:learn_jp/utils/Insert.dart';
import 'package:learn_jp/utils/Query.dart';

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
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).push(PageAnimation(child: VocaSearch())),
          child: Icon(Icons.search),
        ),
        body: vocas == null
            ? Center(child: CircularProgressIndicator())
            : FutureBuilder(
                future: _retrive(),
                builder: (cxt, snap) {
                  if (vocas == null) {
                    return Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Retriving Data..")
                      ],
                    ));
                  } else {
                    return RefreshIndicator(
                      onRefresh: _retrive,
                      child: ListView.builder(
                        itemCount: vocas.length,
                        itemBuilder: (cxt, index) => ChapterItem(vocas[index]),
                      ),
                    );
                  }
                }));
  }

  @override
  void chapters(List<Chapter> chapter) {
    setState(() {
      vocas = chapter;
    });
  }

  @override
  void error(String err) {}

  Future<bool> _retrive() async {
    try {
      var snaphsot =
          await Firestore.instance.collection("grammars").getDocuments();
      var docs = snaphsot.documents;
      var grammars = docs.map((f) => GrammarDAO.fromSnapshot(f)).toList();
      await Insert().insertGrammar(grammars);
      return false;
    } catch (e) {
      return false;
    }
  }
}
