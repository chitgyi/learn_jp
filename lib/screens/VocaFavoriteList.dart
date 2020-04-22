import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/accessvoca.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/components/voca_deatail_item.dart';
import 'package:learn_jp/utils/Query.dart';

class VocaFavoriteList extends StatefulWidget {
  @override
  _VocaFavoriteListState createState() => _VocaFavoriteListState();
}

class _VocaFavoriteListState extends State<VocaFavoriteList> {
  List<Words> words;
  @override
  void initState() {
    super.initState();
    Queries().getFavVoca().then((word) {
      setState(() {
        words = word;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Vocabularies"),
        titleSpacing: 0,
      ),
      body: words == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: words.length,
              itemBuilder: (cxt, index) => VocaDetailItem(
                words: words[index],
                index: index,
                accessVoca: AccessVoca(),
              ),
            ),
    );
  }
}
