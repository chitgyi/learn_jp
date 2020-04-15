import 'package:flutter/cupertino.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/utils/Query.dart';

class VocaSearchPresenter {
  final VocaSearchView _vocaSearchView;
  final TextEditingController _controller;
  VocaSearchPresenter(this._vocaSearchView, this._controller);

  search() async {
    if (_controller.text.isNotEmpty) {
      Query()
          .search(_controller.text)
          .then((words) => _vocaSearchView.result(words));
    } else {
      _vocaSearchView.result(null);
    }
  }
}

abstract class VocaSearchView {
  void result(List<Words> words);
}
