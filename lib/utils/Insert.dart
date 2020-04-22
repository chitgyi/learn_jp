import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/DAO/kotoba.dart';
import 'package:learn_jp/utils/DbHelper.dart';

class Insert {
  Future insertGrammar(List<GrammarDAO> grammars) async {
    try {
      final dbClient = await DbHelper.access();
      grammars.forEach((grammarDAO) async {
        var result = await dbClient
            .query("grammars", where: "id = ?", whereArgs: [grammarDAO.id]);
        if (result.length > 0) {
          await dbClient.update("grammars", grammarDAO.toMap(),
              where: "id = ?", whereArgs: [grammarDAO.id]);
        } else {
          await dbClient.insert("grammars", grammarDAO.toMap());
        }
      });
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

  void updateKotobaFav(bool isFav, int id) async {
    int data = isFav ? 1 : 0;
    var dbClient = await DbHelper.access();
    await dbClient.rawUpdate("update kotoba set isFav = $data where id = $id");
    print("$isFav ==> $id");
  }

  updateFav(GrammarDAO grammarDAO) async {
    try {
      var dbClient = await DbHelper.access();
      await dbClient.update("grammars", {"isFav": grammarDAO.isFav},
          where: "id = ?", whereArgs: [grammarDAO.id]);
    } catch (e) {
      print(e);
    }
  }
}
