import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/DAO/grammar.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/utils/DbHelper.dart';

class Query {
  Future<List<GrammarDAO>> getGrammars(int chapterId) async {
    final db = await DbHelper.access();
    var rows = await db.rawQuery(
        "select * from examples,forms where forms.formId = examples.formId AND forms.chId = $chapterId");

    int index = -1;
    List<GrammarDAO> grammars = new List();
    for (int i = 0; i < rows.length; i++) {
      index = rows[i]['formId'];
      var vv = rows
          .where((f) {
            if (f['formId'] == index) return true;
            return false;
          })
          .map((m) => GrammarEg.fromMap(m))
          .toList();
      grammars.add(
          GrammarDAO(grammarForm: GrammarForm.fromMap(rows[i]), grammarEg: vv));
      i += vv.length - 1;
    }
    return grammars;
  }

  Future<List<GrammarDAO>> getFavGrammars() async {
    final db = await DbHelper.access();
    var rows = await db.rawQuery(
        "select * from examples,forms where forms.formId = examples.formId AND forms.isFav = 1 order by forms.chId");

    int index = -1;
    List<GrammarDAO> grammars = new List();
    for (int i = 0; i < rows.length; i++) {
      index = rows[i]['formId'];
      var vv = rows
          .where((f) {
            if (f['formId'] == index) return true;
            return false;
          })
          .map((m) => GrammarEg.fromMap(m))
          .toList();
      grammars.add(
          GrammarDAO(grammarForm: GrammarForm.fromMap(rows[i]), grammarEg: vv));
      i += vv.length - 1;
    }
    return grammars;
  }

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
