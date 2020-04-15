import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:learn_jp/DAO/kotoba.dart';
import 'package:learn_jp/utils/Insert.dart';

class SQLConverter {
  jsonToSQL() async {
    var jsonData = await rootBundle.loadString("assets/data.json");
    List decodedJson = json.decode(jsonData)['vocal'];
    var kotobas = decodedJson.map((f) => Kotoba.fromMap(f)).toList();
    print(decodedJson[0]);
    for (int i = 0; i < kotobas.length; i++) {
      var kotoba = kotobas[i];
      await Insert().insertKotoba(kotoba, i);
    }
  }
}
