import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:learn_jp/DAO/accessvoca.dart';
import 'package:learn_jp/components/voca_deatail_item.dart';
import 'package:provider/provider.dart';
import 'package:learn_jp/db/MoorHelper.dart';

class VocaDetails extends StatefulWidget {
  final int chapterId;
  VocaDetails(this.chapterId);

  @override
  _VocaDetailsState createState() => _VocaDetailsState();
}

class _VocaDetailsState extends State<VocaDetails> {
  AccessVoca accessVoca = AccessVoca();

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDb>(context);
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          titleSpacing: 0,
          title: ListTile(
            title: Text(
              "Vocabulary",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Chapter ${widget.chapterId + 1}",
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
        body: FutureBuilder(
          future: db.kotobaByCh(widget.chapterId + 1),
          builder: (cxt, snap) {
            switch (snap.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                var chapters = snap.data as List<Kotoba>;

                if (chapters.length > 0) {
                  return ListView.builder(
                    itemCount: chapters.length,
                    itemBuilder: (cxt, index) => VocaDetailItem(
                      kotoba: chapters[index],
                      index: index,
                      accessVoca: accessVoca,
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Kotoba is empty."),
                  );
                }
                break;
              default:
                return Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                  ),
                );
            }
          },
        ));
  }
}