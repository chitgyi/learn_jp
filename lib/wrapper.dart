import 'package:flutter/material.dart';
import 'package:learn_jp/screens/App.dart';
import 'package:learn_jp/screens/Initializing.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNewUser = Provider.of<bool>(context) ?? false;
    if (isNewUser) {
      return Initializing();
    } else {
      return App();
    }
  }
}
