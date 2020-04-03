import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/MVP/VocaSearchMVP.dart';
import 'package:learn_jp/components/voca_deatail_item.dart';

class VocaSearch extends StatefulWidget {
  @override
  _VocaSearchState createState() => _VocaSearchState();
}

class _VocaSearchState extends State<VocaSearch> implements VocaSearchView {
  List<Words> words;
  final _searchController = TextEditingController();
  VocaSearchPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = VocaSearchPresenter(this, _searchController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          controller: _searchController,
          onChanged: (str) => presenter.search(),
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search here..",
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: _showResult(),
    );
  }

  @override
  void result(List<Words> words) {
    setState(() {
      this.words = words;
    });
  }

  _showResult() {
    if (words == null) {
      return Container(
        child: Center(
          child: Text("Search..."),
        ),
      );
    } else if (words.length == 0) {
      return Center(
        child: Text("Not Found!"),
      );
    } else {
      return ListView.builder(
          itemCount: words.length,
          itemBuilder: (cxt, index) => VocaDetailItem(words[index], index));
    }
  }
}
