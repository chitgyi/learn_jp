import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/MVP/VocaMVP.dart';
import 'package:learn_jp/components/styling.dart';
import 'package:learn_jp/screens/Grammar.dart';

class GrammarList extends StatefulWidget {
  @override
  _GrammarListState createState() => _GrammarListState();
}

class _GrammarListState extends State<GrammarList> implements VocaView {
  List<Chapter> chapter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grammar List"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.featured_play_list),
          color: Colors.white,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {},
        )
      ]),
      body: chapter == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 3,
              children: chapter
                  .map((f) => Card(
                        elevation: 3,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (cxt) => Grammar(f.id)));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Icon(
                                  Icons.chrome_reader_mode,
                                  color: Colors.redAccent,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Chpater ${f.id + 1}",
                                  style: title2TextSyle,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Grammar",
                                  style: title2TextSyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    VocaPresenter(this).getChapters();
  }

  @override
  void chapters(List<Chapter> chapter) {
    setState(() {
      this.chapter = chapter;
    });
  }

  @override
  void error(String err) {}
}
