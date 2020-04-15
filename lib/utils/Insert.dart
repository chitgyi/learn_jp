import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/DAO/kotoba.dart';
import 'package:learn_jp/utils/DbHelper.dart';

class Insert {
  insertGrammar() async {
    try {
      final dbClient = await DbHelper.access();
      grammarList.forEach((grammarDAO) async {
        await dbClient.insert('forms', {
          'formId': grammarDAO.grammarForm.id,
          'chId': grammarDAO.grammarForm.chapterId,
          'isFav': grammarDAO.grammarForm.isFav,
          'title': grammarDAO.grammarForm.title,
          'hiragana': grammarDAO.grammarForm.hiragana,
          'romaji': grammarDAO.grammarForm.romaji,
          'mm': grammarDAO.grammarForm.myanmar
        });
        grammarDAO.grammarEg.forEach((grammarEg) async {
          await dbClient.insert('examples', {
            'formId': grammarDAO.grammarForm.id,
            'hiraganaEg': grammarEg.hiragana,
            'romajiEg': grammarEg.romaji,
            'mmEg': grammarEg.myanmar
          });
        });
      });
      print("saved:");
    } catch (e) {
      print("Failed to insert for grammar: [$e]");
    }
  }

  insertKotoba(Kotoba kotoba, int index) async {
    try {
      final dbClient = await DbHelper.access();
      await dbClient.insert('chapter', {'chId': index, 'title': kotoba.title});
      kotoba.words.forEach((word) async {
        await dbClient.insert("kotoba", {
          'chId': index,
          'isFav': 0,
          'myanmar': word.myanmar,
          'english': word.english,
          'romaji': word.romaji,
          'kanji': word.kanji,
          'hiragana': word.hiragana
        });
      });
      print("Inseted..");
    } catch (e) {
      print("Insert Error: [$e]");
    }
  }

  updateFav({bool isFav, int id}) async {
    var dbClient = await DbHelper.access();
    print("Before Updated ${!isFav}");
    var data = isFav ? 1 : 0;
    await dbClient
        .rawUpdate("UPDATE forms SET isFav = $data WHERE formId = $id");
    var after =
        await dbClient.rawQuery("select * from forms where formId = $id");
    print("Updated $after & $id");
  }

  void updateKotobaFav(bool isFav, int id) async{
    int data = isFav?1:0;
    var dbClient = await DbHelper.access();
    await dbClient.rawUpdate("update kotoba set isFav = $data where id = $id");
    print("$isFav ==> $id");
  }
}
