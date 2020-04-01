import 'package:learn_jp/DAO/words.dart';

class Kotoba {
  String title;
  List<Words> words;
  Kotoba.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    List word = map['words'];
    words = word.map((f) => Words.fromMap(f)).toList();
  }
 
}