import 'package:flutter/cupertino.dart';

class Words {
  final int id;
  final String romaji;
  final String hiragana;
  final String kanji;
  final String myanmar;
  final String english;
  Words(
      {@required this.id,
      @required this.english,
      @required this.hiragana,
      @required this.kanji,
      @required this.myanmar,
      @required this.romaji});

  Words.fromMap(Map<String, dynamic> map)
      : romaji = map['romaji'],
        id = map['chapter_id'] as int,
        kanji = map['kanji'],
        myanmar = map['mynamar'],
        english = map['eng'],
        hiragana = map['hirakana'];
}
