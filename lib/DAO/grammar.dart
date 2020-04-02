import 'package:flutter/foundation.dart';

class GrammarForm {
  final String title;
  final String hiragana;
  final String romaji;
  final String myanmar;

  GrammarForm(
      {@required this.myanmar,
      @required this.romaji,
      @required this.hiragana,
      @required this.title});

  GrammarForm.fromMap(Map<String, dynamic> data)
      : title = data['title'],
        hiragana = data['hiragana'],
        romaji = data['romaji'],
        myanmar = data['myanmar'];
}

class GrammarEg {
  final String hiragana;
  final String romaji;
  final String myanmar;

  GrammarEg({
    @required this.myanmar,
    @required this.romaji,
    @required this.hiragana,
  });

  GrammarEg.fromMap(Map<String, dynamic> data)
      : hiragana = data['hiragana'],
        romaji = data['romaji'],
        myanmar = data['myanmar'];
}

class GrammarDAO {
  final GrammarForm grammarForm;
  final GrammarFav grammarFav;
  final List<GrammarEg> grammarEg;
  GrammarDAO(
      {@required this.grammarFav,
      @required this.grammarForm,
      @required this.grammarEg});
}

class GrammarFav {
  final int id;
  final bool isFav;

  GrammarFav({@required this.id, @required this.isFav});
  GrammarFav.fromMap(Map<String, dynamic> data)
      : id = data['id'] as int,
        isFav = data['isFav'] as bool;
}

final grammarList = <GrammarDAO>[
  GrammarDAO(
      grammarFav: GrammarFav(id: 1, isFav: false),
      grammarForm: GrammarForm(
          title: "~ ဖြစ်ပါသည်",
          hiragana: "--- は --- です",
          romaji: "---wa --- desu",
          myanmar: "သည်/က---ဖြစ်ပါသည်။"),
      grammarEg: [
        GrammarEg(
            hiragana: "わたし は ミラー です。",
            romaji: "watashi wa mira- desu.",
            myanmar: "ကျွန်တော်က နီလာဖြစ်ပါတယ်။"),
        GrammarEg(
            hiragana: "わたし は ミラー です。",
            romaji: "watashi wa mira- desu.",
            myanmar: "ကျွန်တော်က နီလာဖြစ်ပါတယ်။"),
      ]),
  GrammarDAO(
      grammarFav: GrammarFav(id: 2, isFav: true),
      grammarForm: GrammarForm(
          title: "~ မဟုတ်ပါဘူး။",
          hiragana: "--- は --- じゃ（では） ありません",
          romaji: "---wa ---jya(dewa) arimasen ",
          myanmar: "သည်/က---မဟုတ်ပါဘူး။"),
      grammarEg: [
        GrammarEg(
            hiragana: "わたし は がくせい じゃありません。",
            romaji: "watashi wa gakusei jya arimasen ",
            myanmar: "ကျွန်တော် ကျောင်းသားမဟုတ်ပါဘူး။"),
        GrammarEg(
            hiragana: "わたし は がくせい じゃありません。",
            romaji: "watashi wa gakusei jya arimasen ",
            myanmar: "ကျွန်တော် ကျောင်းသားမဟုတ်ပါဘူး။"),
      ]),
  GrammarDAO(
      grammarFav: GrammarFav(id: 3, isFav: true),
      grammarForm: GrammarForm(
          title: "~ ဖြစ်ပါသလား?",
          hiragana: "---は ---ですか",
          romaji: "---wa ---desuka ",
          myanmar: "သည်/က---ဖြစ်ပါသလား?"),
      grammarEg: [
        GrammarEg(
            hiragana: "ミラーさん は かいしゃいん ですか？ ",
            romaji: "mira-san wa kaisha in desuka",
            myanmar: "မီလာစံက ကုမ္ပဏီ၀န်ထမ်း ဖြစ်ပါသလား?"),
      ]),
];

//grammmarfav, grammarform, grammareg
//[fav_id, isFav, form_id],
//[title, hiragana, romaji, myanmar, id, chapter_id],
//[id, form_id, hiragana, romaji, myanmar]
