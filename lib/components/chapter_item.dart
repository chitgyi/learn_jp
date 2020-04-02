import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/components/styling.dart';
import 'package:learn_jp/screens/VocaDetails.dart';

class ChapterItem extends StatelessWidget {
  final Chapter chapter;
  ChapterItem(this.chapter);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (cxt)=>VocaDetails(chapter.id)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.book,
              color: Colors.redAccent,
            ),
            Text(
              "Chapter ${chapter.id + 1}",
              style: title2TextSyle,
            ),
          ],
        ),
      ),
    );
  }
}
