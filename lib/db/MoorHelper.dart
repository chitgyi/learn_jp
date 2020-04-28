import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:moor/moor.dart';

// These imports are only needed to open the database
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'MoorHelper.g.dart';

@UseMoor(
  // relative import for the moor file. Moor also supports `package:`
  // imports
  include: {'tables.moor'},
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Chapter>> get allChapters => select(chapter).get();

  Future<List<Kotoba>> get allFavKotobas =>
      (select(kotoba)..where((g) => g.isFav.equals(1))).get();

  Future<List<Kotoba>> kotobaByCh(int chapterId) {
    return (select(kotoba)..where((k) => k.chId.equals(chapterId))).get();
  }

  Future<int> setFavKotoba(int id, int isFav) {
    return (update(kotoba)..where((w) => w.id.equals(id)))
        .write(Kotoba(isFav: isFav));
  }

  Future<List<Kotoba>> search(String data) async {
    var result = await customSelectQuery(
      "select * from kotoba where (romaji || myanmar || hiragana || english) like '%$data%' limit 25",
    ).get();
    return result.map((f) => Kotoba.fromJson(f.data)).toList();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    String path = p.join(dbFolder.path, 'jp.db');
    io.File file = io.File(path);
    bool isExist = await file.exists();
    if (!isExist) {
      ByteData data = await rootBundle.load("assets/db/jp.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      file = await io.File(path).writeAsBytes(bytes);
    }
    return VmDatabase(file);
  });
}
