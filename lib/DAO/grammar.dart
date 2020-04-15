import 'package:flutter/foundation.dart';

class GrammarForm {
  final int id;
  final int chapterId;
  final String title;
  final String hiragana;
  final String romaji;
  final String myanmar;
  final int isFav;

  GrammarForm(
      {@required this.myanmar,
      @required this.id,
      @required this.isFav,
      @required this.chapterId,
      @required this.romaji,
      @required this.hiragana,
      @required this.title});

  GrammarForm.fromMap(Map<String, dynamic> data)
      : title = data['title'],
        id = data['formId'],
        isFav = data['isFav'],
        chapterId = data['chId'],
        hiragana = data['hiragana'],
        romaji = data['romaji'],
        myanmar = data['mm'];
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
      : hiragana = data['hiraganaEg'],
        romaji = data['romajiEg'],
        myanmar = data['mmEg'];
}

class GrammarDAO {
  final GrammarForm grammarForm;
  final List<GrammarEg> grammarEg;
  GrammarDAO({@required this.grammarForm, @required this.grammarEg});
  GrammarDAO.fromMap(Map<String, dynamic> data)
      : grammarEg = data['grammarEg'],
        grammarForm = data['grammarForm'];
}

final grammarList = <GrammarDAO>[
  GrammarDAO(
      grammarForm: GrammarForm(
          id: 0,
          chapterId: 0,
          isFav: 0,
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
            hiragana: "ミラー です。",
            romaji: "mira- desu.",
            myanmar: "နီလာဖြစ်ပါတယ်။"),
      ]),
  GrammarDAO(
      grammarForm: GrammarForm(
          id: 5,
          chapterId: 1,
          isFav: 0,
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
            hiragana: "がくせい じゃありません。",
            romaji: "gakusei jya arimasen ",
            myanmar: "ကျောင်းသားမဟုတ်ပါဘူး။"),
      ]),
  GrammarDAO(
      grammarForm: GrammarForm(
          id: 2,
          chapterId: 2,
          isFav: 0,
          title: "~ ဖြစ်ပါသလား?",
          hiragana: "---は ---ですか",
          romaji: "---wa ---desuka ",
          myanmar: "သည်/က---ဖြစ်ပါသလား?"),
      grammarEg: [
        GrammarEg(
            hiragana: "ミラーさん は かいしゃいん ですか？ ",
            romaji: "mira-san wa kaisha in desuka",
            myanmar: "မီလာစံက ကုမ္ပဏီ၀န်ထမ်း ဖြစ်ပါသလား?"),
        GrammarEg(
            hiragana: "ミラーさん は かいしゃいん ですか？ ",
            romaji: "mira-san wa kaisha in desuka",
            myanmar: "မီလာစံက ကုမ္ပဏီ၀န်ထမ်း ဖြစ်ပါသလား?")
      ]),
];

//grammmarfav, grammarform, grammareg
//[fav_id, isFav, form_id],
//[title, hiragana, romaji, myanmar, id, chapter_id],
//[id, form_id, hiragana, romaji, myanmar]
