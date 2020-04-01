import 'dart:convert';

import 'package:learn_jp/DAO/kotoba.dart';
import 'package:learn_jp/utils/DbHelper.dart';


class SQLConverter {
  DbHelper _dbHelper = DbHelper();

  jsonToSQL(final String jsonData) async {
    List decodedJson = json.decode(jsonData)['vocal'];
    var kotobas = decodedJson.map((f) => Kotoba.fromMap(f)).toList();
    for (int i = 0; i < kotobas.length; i++) {
      var kotoba = kotobas[i];
      await _dbHelper.insert(kotoba, i);
    }
  }
}
