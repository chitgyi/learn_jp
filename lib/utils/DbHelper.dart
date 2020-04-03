import 'dart:async';

import 'package:flutter/services.dart';
import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/DAO/kotoba.dart';
import 'package:learn_jp/DAO/words.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dart:io' as io;

class DbHelper {
  static Database _db;
  static const String DB_NAME = "kotoba.db";
  static const String KOTOBA_TABLE = 'kotoba';
  static const String KOTOBA_ID = 'id';
  static const String CHAPTER_ID = 'chapter_id';
  static const String MM = 'mynamar';
  static const String ENG = 'eng';
  static const String KANJI = 'kanji';
  static const String HIRAGANA = 'hirakana';
  static const String ROMAJI = 'romaji';

  static const String CHAPTER_TABLE = 'chapter';
  static const String ID = 'id';
  static const String TITLE = 'title';

  static DbHelper _dbHelper;
  static DbHelper access() {
    if (_dbHelper == null) {
      return DbHelper();
    }
    return _dbHelper;
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Database db;
    try {
      io.Directory directory = await getApplicationDocumentsDirectory();
      String path = join(directory.path, DB_NAME);
      db = await openDatabase(path);
    } catch (e) {
      print("EXCEPION! ${e.message}");
    }
    return db;
  }

  initializeDb() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DB_NAME);
    await deleteDatabase(path);
    ByteData data = await rootBundle.load("assets/db/kotoba.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await io.File(path).writeAsBytes(bytes);
    print("Created Db for new user!");
  }

  onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $KOTOBA_TABLE($KOTOBA_ID INTEGER PRIMARY KEY AUTOINCREMENT, $CHAPTER_ID INTERGER, $MM TEXT, $ENG TEXT, $ROMAJI TEXT, $KANJI TEXT, $HIRAGANA TEXT)",
    );
    await db.execute(
        "CREATE TABLE $CHAPTER_TABLE($ID INTERGER PRIMARY KEY, $TITLE TEXT)");
  }

  insert(Kotoba kotoba, int index) async {
    var dbClient = await db;
    dbClient.insert(CHAPTER_TABLE, {ID: index, TITLE: kotoba.title});
    kotoba.words.forEach((word) {
      dbClient.insert(KOTOBA_TABLE, {
        CHAPTER_ID: index,
        MM: word.myanmar,
        ENG: word.english,
        ROMAJI: word.romaji,
        KANJI: word.kanji,
        HIRAGANA: word.hiragana
      });
    });
  }

  Future<List<Map<String, dynamic>>> retrieve() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $KOTOBA_TABLE, $CHAPTER_TABLE WHERE $CHAPTER_ID = 0 AND kotoba.chapter_id = chapter.id");
    return result;
  }

  Future<int> delete() async {
    var dbClient = await db;
    var result = await dbClient.delete(KOTOBA_TABLE);
    await dbClient.delete(CHAPTER_TABLE);
    return result;
  }

  saveDbToExternalDir() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DB_NAME);
    var dir = await getExternalStorageDirectory();
    await new io.File(path).copy("${dir.path}/kotoba.db");
  }

  Future<List<Chapter>> getChapters() async {
    var dbClient = await db;
    List<Map<String, dynamic>> chapters = await dbClient.query(CHAPTER_TABLE);
    return chapters.map((f) => Chapter.fromMap(f)).toList();
  }

  Future<List<Words>> getVocabulary(int id) async {
    var dbClient = await db;
    List<Map<String, dynamic>> words = await dbClient
        .rawQuery("SELECT * FROM $KOTOBA_TABLE WHERE $CHAPTER_ID = $id");
    return words.map((f) => Words.fromMap(f)).toList();
  }

  Future<List<Words>> search(String data) async {
    try {
      var dbClient = await db;
      var words = await dbClient.rawQuery(
          "select * from $KOTOBA_TABLE where ($ROMAJI || $MM ||$HIRAGANA) like '%${data.toString()}%' limit 25");
      return words.map((f) => Words.fromMap(f)).toList();
    } catch (e) {
      return null;
    }
  }
}
