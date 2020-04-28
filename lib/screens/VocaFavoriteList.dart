import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/accessvoca.dart';
import 'package:learn_jp/components/voca_deatail_item.dart';
import 'package:learn_jp/db/MoorHelper.dart';
import 'package:provider/provider.dart';

class VocaFavoriteList extends StatelessWidget {
  final AccessVoca accessVoca = AccessVoca();
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDb>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite Vocabularies"),
          titleSpacing: 0,
        ),
        body: FutureBuilder(
          future: db.allFavKotobas,
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

//  words == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: words.length,
//               itemBuilder: (cxt, index) => VocaDetailItem(
//                 words: words[index],
//                 index: index,
//                 accessVoca: AccessVoca(),
//               ),
//             ),
