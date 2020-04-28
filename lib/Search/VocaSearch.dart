import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/accessvoca.dart';
import 'package:learn_jp/MVP/VocaSearchMVP.dart';
import 'package:learn_jp/components/voca_deatail_item.dart';
import 'package:learn_jp/db/MoorHelper.dart';
import 'package:provider/provider.dart';

class VocaSearch extends StatefulWidget {
  @override
  _VocaSearchState createState() => _VocaSearchState();
}

class _VocaSearchState extends State<VocaSearch> implements VocaSearchView {
  List<Kotoba> kotobas;
  final _searchController = TextEditingController();
  VocaSearchPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = VocaSearchPresenter(
        this, _searchController, Provider.of<AppDb>(context));
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
  void result(List<Kotoba> kotobas) {
    setState(() {
      this.kotobas = kotobas;
    });
  }

  _showResult() {
    if (kotobas == null) {
      return Container(
        child: Center(
          child: Text("Search..."),
        ),
      );
    } else if (kotobas.length == 0) {
      return Center(
        child: Text("Not Found!"),
      );
    } else {
      return ListView.builder(
          itemCount: kotobas.length,
          itemBuilder: (cxt, index) => VocaDetailItem(
                kotoba: kotobas[index],
                index: index,
                accessVoca: AccessVoca(),
              ));
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
