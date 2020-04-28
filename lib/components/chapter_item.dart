import 'package:flutter/material.dart';
import 'package:learn_jp/animation/PageAnimation.dart';
import 'package:learn_jp/db/MoorHelper.dart';
import 'package:learn_jp/screens/Exercise.dart';
import 'package:learn_jp/screens/Grammar.dart';
import 'package:learn_jp/screens/VocaDetails.dart';

class ChapterItem extends StatelessWidget {
  final Chapter chapter;
  ChapterItem(this.chapter);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: <Widget>[
          ListBody(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Chapter ${chapter.id}",
                ),
                subtitle: Text(chapter.title),
              ),
              ListTile(
                title: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        "Vocabularies",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => Navigator.of(context)
                          .push(PageAnimation(child: VocaDetails(chapter.id))),
                    ),
                    FlatButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        "Grammars",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (cxt) => Grammar(chapter.id))),
                    ),
                    FlatButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        "Exercises",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(PageAnimation(child: Exercise(chapter.id)));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
