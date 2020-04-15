import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_jp/utils/DbHelper.dart';
import 'package:learn_jp/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<bool>.value(
      value: isNewUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color.fromRGBO(245, 41, 40, 1),
            accentColor: Colors.redAccent),
        home: Wrapper(),
      ),
    );
  }

  Stream<bool> isNewUser() async* {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool newUser = preferences.getBool("newUser") ?? true;

    if (newUser) {
      yield true;
      await DbHelper().initializeDb();
      print("Created Db!");
      preferences.setBool("newUser", false);
    }
    print("Db exists!");
    yield false;
  }
}
