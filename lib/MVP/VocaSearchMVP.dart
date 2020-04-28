import 'package:flutter/cupertino.dart';
import 'package:learn_jp/db/MoorHelper.dart';

class VocaSearchPresenter {
  final VocaSearchView _vocaSearchView;
  final TextEditingController _controller;
  final AppDb appDb;
  VocaSearchPresenter(this._vocaSearchView, this._controller, this.appDb);

  search() async {
    if (_controller.text.isNotEmpty) {
      appDb
          .search(_controller.text)
          .then((kotobas) => _vocaSearchView.result(kotobas));
    } else {
      _vocaSearchView.result(null);
    }
  }
}

abstract class VocaSearchView {
  void result(List<Kotoba> words);
}
