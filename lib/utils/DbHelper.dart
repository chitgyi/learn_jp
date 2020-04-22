import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dart:io' as io;

class DbHelper {
  static Database _db;

  static Future<Database> access() async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    }

    return _db;
  }

  static Future<Database> initDb() async {
    Database db;
    try {
      io.Directory directory = await getApplicationDocumentsDirectory();
      String path = join(directory.path, "jp.db");
      db = await openDatabase(path);
    } catch (e) {
      print("INIT EXCEPION! ${e.message}");
    }
    return db;
  }

  initializeDb() async {
    try {
      io.Directory directory = await getApplicationDocumentsDirectory();
      String path = join(directory.path, "jp.db");

      await deleteDatabase(path);

      ByteData data = await rootBundle.load("assets/db/jp.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await io.File(path).writeAsBytes(bytes);

      var dbClient = await DbHelper.access();
      await createTables(dbClient);
      print("Created Db & Tables for new user!");
    } catch (e) {
      print("Setting db error: [$e]");
    }
  }

  createTables(Database db) async {
    await deleteBaseTables();
    await db.execute(
        "CREATE TABLE IF NOT EXISTS'grammars'('id' TEXT, chapter integer,note TEXT, isFav integer default 0, title TEXT, hiragana TEXT, myanmar TEXT, examples TEXT)");
    print("Created grammars");
  }

  deleteBaseTables() async {
    try {
      var dbClient = await DbHelper.access();
      await dbClient.execute("DROP TABLE IF EXISTS grammars");
      //await dbClient.execute("DROP TABLE IF EXISTS examples");
      print("Deleted..");
    } catch (e) {
      print("DROP ERROR: [$e]");
    }
  }

  createBaseTables() async {
    try {
      await deleteBaseTables();
      var db = await DbHelper.access();
      await db.execute(
          "CREATE TABLE IF NOT EXISTS 'chapter'(id INTEGER PRIMARY KEY AUTOINCREMENT, chId INTEGER, title TEXT)");
      await db.execute(
        "CREATE TABLE IF NOT EXISTS 'kotoba'(id INTEGER PRIMARY KEY AUTOINCREMENT, chId INTEGER,isFav integer default 0, myanmar TEXT, romaji TEXT, hiragana TEXT, english TEXT, kanji TEXT)",
      );
      print("CREATED BASE TABLES");
    } catch (e) {
      print("Creation BaseTable Error: [$e]");
    }
  }

  saveDbToExternalDir() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "jp.db");
    var dir = await getExternalStorageDirectory();
    await new io.File(path).copy("${dir.path}/jp.db");
  }
}
