import 'package:flutter/cupertino.dart';

class Words {
  final int id;
  final int chId;
  final int isFav;
  final String romaji;
  final String hiragana;
  final String kanji;
  final String myanmar;
  final String english;
  Words(
      {this.id,
      @required this.chId,
      @required this.isFav,
      @required this.english,
      @required this.hiragana,
      @required this.kanji,
      @required this.myanmar,
      @required this.romaji});

  Words.fromMap(Map<String, dynamic> map)
      : romaji = map['romaji'],
        id = map['id'] as int,
        chId = map['chId'] as int,
        isFav = map['isFav'] as int,
        kanji = map['kanji'],
        myanmar = map['myanmar'],
        english = map['english'],
        hiragana = map['hiragana'];
}
