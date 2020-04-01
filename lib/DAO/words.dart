class Words {
  String romaji;
  String hiragana;
  String kanji;
  String myanmar;
  String english;
  Words.fromMap(Map<String, dynamic> map)
      : romaji = map['romaji'],
        kanji = map['kanji'],
        myanmar = map['mynamar'],
        english = map['eng'],
        hiragana = map['hirakana'];
}
