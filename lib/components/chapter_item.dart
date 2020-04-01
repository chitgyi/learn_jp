import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/screens/LessonPage.dart';


class ChapterItem extends StatelessWidget {
  final Chapter chapter;
  ChapterItem(this.chapter);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Material(
        color: Colors.red[300],
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (cxt) => LessonPage(chapter.id)));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Chapter ${chapter.id + 1}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Text(
                  chapter.titile,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
