import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/utils/DbHelper.dart';

class Queries {
  Future<List<Words>> search(String data) async {
    try {
      final db = await DbHelper.access();
      var words = await db.rawQuery(
          "select * from kotoba where (romaji || myanmar || hiragana) like '%${data.toString()}%' limit 25");
      return words.map((f) => Words.fromMap(f)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<int> getNumOfGrammar() async {
    final db = await DbHelper.access();
    var result = await db.rawQuery("select count(*) as num from grammars");
    return result[0]['num'];
  }

  Future<List<GrammarDAO>> getFavGrammar() async {
    try {
      final db = await DbHelper.access();
      var words =
          await db.query("grammars", where: "isFav = ?", whereArgs: [1]);
      return words.map((f) => GrammarDAO.fromMap(f)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<GrammarDAO>> getGrammar(int chapter) async {
    try {
      final db = await DbHelper.access();
      var words = await db
          .query("grammars", where: "chapter = ?", whereArgs: [chapter]);
      return words.map((f) => GrammarDAO.fromMap(f)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Chapter>> getChapters() async {
    final db = await DbHelper.access();
    List<Map<String, dynamic>> chapters = await db.query("chapter");
    return chapters.map((f) => Chapter.fromMap(f)).toList();
  }

  Future<List<Words>> getVocabulary(int id) async {
    final db = await DbHelper.access();
    List<Map<String, dynamic>> words =
        await db.rawQuery("SELECT * FROM kotoba WHERE chId = $id");
    return words.map((f) => Words.fromMap(f)).toList();
  }

  Future<List<Words>> getFavVoca() async {
    final db = await DbHelper.access();
    List<Map<String, dynamic>> words =
        await db.rawQuery("select * from kotoba where isFav = 1");
    return words.map((f) => Words.fromMap(f)).toList();
  }
}
