// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoorHelper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Chapter extends DataClass implements Insertable<Chapter> {
  final int id;
  final int chId;
  final String title;
  Chapter({this.id, this.chId, this.title});
  factory Chapter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Chapter(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      chId: intType.mapFromDatabaseResponse(data['${effectivePrefix}chId']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
    );
  }
  factory Chapter.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<int>(json['id']),
      chId: serializer.fromJson<int>(json['chId']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chId': serializer.toJson<int>(chId),
      'title': serializer.toJson<String>(title),
    };
  }

  @override
  ChapterCompanion createCompanion(bool nullToAbsent) {
    return ChapterCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      chId: chId == null && nullToAbsent ? const Value.absent() : Value(chId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
    );
  }

  Chapter copyWith({int id, int chId, String title}) => Chapter(
        id: id ?? this.id,
        chId: chId ?? this.chId,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('chId: $chId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(chId.hashCode, title.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.chId == this.chId &&
          other.title == this.title);
}

class ChapterCompanion extends UpdateCompanion<Chapter> {
  final Value<int> id;
  final Value<int> chId;
  final Value<String> title;
  const ChapterCompanion({
    this.id = const Value.absent(),
    this.chId = const Value.absent(),
    this.title = const Value.absent(),
  });
  ChapterCompanion.insert({
    this.id = const Value.absent(),
    this.chId = const Value.absent(),
    this.title = const Value.absent(),
  });
  ChapterCompanion copyWith(
      {Value<int> id, Value<int> chId, Value<String> title}) {
    return ChapterCompanion(
      id: id ?? this.id,
      chId: chId ?? this.chId,
      title: title ?? this.title,
    );
  }
}

class ChapterTable extends Table with TableInfo<ChapterTable, Chapter> {
  final GeneratedDatabase _db;
  final String _alias;
  ChapterTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        declaredAsPrimaryKey: true,
        hasAutoIncrement: true,
        $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  }

  final VerificationMeta _chIdMeta = const VerificationMeta('chId');
  GeneratedIntColumn _chId;
  GeneratedIntColumn get chId => _chId ??= _constructChId();
  GeneratedIntColumn _constructChId() {
    return GeneratedIntColumn('chId', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, chId, title];
  @override
  ChapterTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chapter';
  @override
  final String actualTableName = 'chapter';
  @override
  VerificationContext validateIntegrity(ChapterCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.chId.present) {
      context.handle(
          _chIdMeta, chId.isAcceptableValue(d.chId.value, _chIdMeta));
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chapter map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Chapter.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ChapterCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.chId.present) {
      map['chId'] = Variable<int, IntType>(d.chId.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    return map;
  }

  @override
  ChapterTable createAlias(String alias) {
    return ChapterTable(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Kotoba extends DataClass implements Insertable<Kotoba> {
  final int id;
  final int chId;
  final int isFav;
  final String myanmar;
  final String romaji;
  final String hiragana;
  final String english;
  final String kanji;
  Kotoba(
      {this.id,
      this.chId,
      this.isFav,
      this.myanmar,
      this.romaji,
      this.hiragana,
      this.english,
      this.kanji});
  factory Kotoba.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Kotoba(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      chId: intType.mapFromDatabaseResponse(data['${effectivePrefix}chId']),
      isFav: intType.mapFromDatabaseResponse(data['${effectivePrefix}isFav']),
      myanmar:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}myanmar']),
      romaji:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}romaji']),
      hiragana: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}hiragana']),
      english:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}english']),
      kanji:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}kanji']),
    );
  }
  factory Kotoba.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Kotoba(
      id: serializer.fromJson<int>(json['id']),
      chId: serializer.fromJson<int>(json['chId']),
      isFav: serializer.fromJson<int>(json['isFav']),
      myanmar: serializer.fromJson<String>(json['myanmar']),
      romaji: serializer.fromJson<String>(json['romaji']),
      hiragana: serializer.fromJson<String>(json['hiragana']),
      english: serializer.fromJson<String>(json['english']),
      kanji: serializer.fromJson<String>(json['kanji']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chId': serializer.toJson<int>(chId),
      'isFav': serializer.toJson<int>(isFav),
      'myanmar': serializer.toJson<String>(myanmar),
      'romaji': serializer.toJson<String>(romaji),
      'hiragana': serializer.toJson<String>(hiragana),
      'english': serializer.toJson<String>(english),
      'kanji': serializer.toJson<String>(kanji),
    };
  }

  @override
  KotobaCompanion createCompanion(bool nullToAbsent) {
    return KotobaCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      chId: chId == null && nullToAbsent ? const Value.absent() : Value(chId),
      isFav:
          isFav == null && nullToAbsent ? const Value.absent() : Value(isFav),
      myanmar: myanmar == null && nullToAbsent
          ? const Value.absent()
          : Value(myanmar),
      romaji:
          romaji == null && nullToAbsent ? const Value.absent() : Value(romaji),
      hiragana: hiragana == null && nullToAbsent
          ? const Value.absent()
          : Value(hiragana),
      english: english == null && nullToAbsent
          ? const Value.absent()
          : Value(english),
      kanji:
          kanji == null && nullToAbsent ? const Value.absent() : Value(kanji),
    );
  }

  Kotoba copyWith(
          {int id,
          int chId,
          int isFav,
          String myanmar,
          String romaji,
          String hiragana,
          String english,
          String kanji}) =>
      Kotoba(
        id: id ?? this.id,
        chId: chId ?? this.chId,
        isFav: isFav ?? this.isFav,
        myanmar: myanmar ?? this.myanmar,
        romaji: romaji ?? this.romaji,
        hiragana: hiragana ?? this.hiragana,
        english: english ?? this.english,
        kanji: kanji ?? this.kanji,
      );
  @override
  String toString() {
    return (StringBuffer('Kotoba(')
          ..write('id: $id, ')
          ..write('chId: $chId, ')
          ..write('isFav: $isFav, ')
          ..write('myanmar: $myanmar, ')
          ..write('romaji: $romaji, ')
          ..write('hiragana: $hiragana, ')
          ..write('english: $english, ')
          ..write('kanji: $kanji')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          chId.hashCode,
          $mrjc(
              isFav.hashCode,
              $mrjc(
                  myanmar.hashCode,
                  $mrjc(
                      romaji.hashCode,
                      $mrjc(hiragana.hashCode,
                          $mrjc(english.hashCode, kanji.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Kotoba &&
          other.id == this.id &&
          other.chId == this.chId &&
          other.isFav == this.isFav &&
          other.myanmar == this.myanmar &&
          other.romaji == this.romaji &&
          other.hiragana == this.hiragana &&
          other.english == this.english &&
          other.kanji == this.kanji);
}

class KotobaCompanion extends UpdateCompanion<Kotoba> {
  final Value<int> id;
  final Value<int> chId;
  final Value<int> isFav;
  final Value<String> myanmar;
  final Value<String> romaji;
  final Value<String> hiragana;
  final Value<String> english;
  final Value<String> kanji;
  const KotobaCompanion({
    this.id = const Value.absent(),
    this.chId = const Value.absent(),
    this.isFav = const Value.absent(),
    this.myanmar = const Value.absent(),
    this.romaji = const Value.absent(),
    this.hiragana = const Value.absent(),
    this.english = const Value.absent(),
    this.kanji = const Value.absent(),
  });
  KotobaCompanion.insert({
    this.id = const Value.absent(),
    this.chId = const Value.absent(),
    this.isFav = const Value.absent(),
    this.myanmar = const Value.absent(),
    this.romaji = const Value.absent(),
    this.hiragana = const Value.absent(),
    this.english = const Value.absent(),
    this.kanji = const Value.absent(),
  });
  KotobaCompanion copyWith(
      {Value<int> id,
      Value<int> chId,
      Value<int> isFav,
      Value<String> myanmar,
      Value<String> romaji,
      Value<String> hiragana,
      Value<String> english,
      Value<String> kanji}) {
    return KotobaCompanion(
      id: id ?? this.id,
      chId: chId ?? this.chId,
      isFav: isFav ?? this.isFav,
      myanmar: myanmar ?? this.myanmar,
      romaji: romaji ?? this.romaji,
      hiragana: hiragana ?? this.hiragana,
      english: english ?? this.english,
      kanji: kanji ?? this.kanji,
    );
  }
}

class KotobaTable extends Table with TableInfo<KotobaTable, Kotoba> {
  final GeneratedDatabase _db;
  final String _alias;
  KotobaTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        declaredAsPrimaryKey: true,
        hasAutoIncrement: true,
        $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  }

  final VerificationMeta _chIdMeta = const VerificationMeta('chId');
  GeneratedIntColumn _chId;
  GeneratedIntColumn get chId => _chId ??= _constructChId();
  GeneratedIntColumn _constructChId() {
    return GeneratedIntColumn('chId', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _isFavMeta = const VerificationMeta('isFav');
  GeneratedIntColumn _isFav;
  GeneratedIntColumn get isFav => _isFav ??= _constructIsFav();
  GeneratedIntColumn _constructIsFav() {
    return GeneratedIntColumn('isFav', $tableName, true,
        $customConstraints: 'default 0',
        defaultValue: const CustomExpression<int, IntType>('0'));
  }

  final VerificationMeta _myanmarMeta = const VerificationMeta('myanmar');
  GeneratedTextColumn _myanmar;
  GeneratedTextColumn get myanmar => _myanmar ??= _constructMyanmar();
  GeneratedTextColumn _constructMyanmar() {
    return GeneratedTextColumn('myanmar', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _romajiMeta = const VerificationMeta('romaji');
  GeneratedTextColumn _romaji;
  GeneratedTextColumn get romaji => _romaji ??= _constructRomaji();
  GeneratedTextColumn _constructRomaji() {
    return GeneratedTextColumn('romaji', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _hiraganaMeta = const VerificationMeta('hiragana');
  GeneratedTextColumn _hiragana;
  GeneratedTextColumn get hiragana => _hiragana ??= _constructHiragana();
  GeneratedTextColumn _constructHiragana() {
    return GeneratedTextColumn('hiragana', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _englishMeta = const VerificationMeta('english');
  GeneratedTextColumn _english;
  GeneratedTextColumn get english => _english ??= _constructEnglish();
  GeneratedTextColumn _constructEnglish() {
    return GeneratedTextColumn('english', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _kanjiMeta = const VerificationMeta('kanji');
  GeneratedTextColumn _kanji;
  GeneratedTextColumn get kanji => _kanji ??= _constructKanji();
  GeneratedTextColumn _constructKanji() {
    return GeneratedTextColumn('kanji', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, chId, isFav, myanmar, romaji, hiragana, english, kanji];
  @override
  KotobaTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'kotoba';
  @override
  final String actualTableName = 'kotoba';
  @override
  VerificationContext validateIntegrity(KotobaCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.chId.present) {
      context.handle(
          _chIdMeta, chId.isAcceptableValue(d.chId.value, _chIdMeta));
    }
    if (d.isFav.present) {
      context.handle(
          _isFavMeta, isFav.isAcceptableValue(d.isFav.value, _isFavMeta));
    }
    if (d.myanmar.present) {
      context.handle(_myanmarMeta,
          myanmar.isAcceptableValue(d.myanmar.value, _myanmarMeta));
    }
    if (d.romaji.present) {
      context.handle(
          _romajiMeta, romaji.isAcceptableValue(d.romaji.value, _romajiMeta));
    }
    if (d.hiragana.present) {
      context.handle(_hiraganaMeta,
          hiragana.isAcceptableValue(d.hiragana.value, _hiraganaMeta));
    }
    if (d.english.present) {
      context.handle(_englishMeta,
          english.isAcceptableValue(d.english.value, _englishMeta));
    }
    if (d.kanji.present) {
      context.handle(
          _kanjiMeta, kanji.isAcceptableValue(d.kanji.value, _kanjiMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Kotoba map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Kotoba.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(KotobaCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.chId.present) {
      map['chId'] = Variable<int, IntType>(d.chId.value);
    }
    if (d.isFav.present) {
      map['isFav'] = Variable<int, IntType>(d.isFav.value);
    }
    if (d.myanmar.present) {
      map['myanmar'] = Variable<String, StringType>(d.myanmar.value);
    }
    if (d.romaji.present) {
      map['romaji'] = Variable<String, StringType>(d.romaji.value);
    }
    if (d.hiragana.present) {
      map['hiragana'] = Variable<String, StringType>(d.hiragana.value);
    }
    if (d.english.present) {
      map['english'] = Variable<String, StringType>(d.english.value);
    }
    if (d.kanji.present) {
      map['kanji'] = Variable<String, StringType>(d.kanji.value);
    }
    return map;
  }

  @override
  KotobaTable createAlias(String alias) {
    return KotobaTable(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  ChapterTable _chapter;
  ChapterTable get chapter => _chapter ??= ChapterTable(this);
  KotobaTable _kotoba;
  KotobaTable get kotoba => _kotoba ??= KotobaTable(this);
  Kotoba _rowToKotoba(QueryRow row) {
    return Kotoba(
      id: row.readInt('id'),
      chId: row.readInt('chId'),
      isFav: row.readInt('isFav'),
      myanmar: row.readString('myanmar'),
      romaji: row.readString('romaji'),
      hiragana: row.readString('hiragana'),
      english: row.readString('english'),
      kanji: row.readString('kanji'),
    );
  }

  Selectable<Kotoba> searchKotoba() {
    return customSelectQuery(
        'select * from kotoba where (romaji || myanmar || hiragana) like \'%?%\' limit 25',
        variables: [],
        readsFrom: {kotoba}).map(_rowToKotoba);
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [chapter, kotoba];
}
