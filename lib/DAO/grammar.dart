import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class GrammarData {
  String note;
  int isFav = 0;
  final int chapter;
  final String id, hiragana, myanmar, title;
  final List<dynamic> example;

  GrammarData(
      {this.id, this.note, this.title,this.chapter, this.myanmar, this.hiragana, this.example});

  GrammarData.fromSnapshot(DocumentSnapshot snapshot)
      : note = snapshot.data['note'],
        chapter = snapshot.data['chapter'],
        isFav = 0,
        id = snapshot.documentID,
        hiragana = snapshot.data['hiragana'],
        myanmar = snapshot.data['myanmar'],
        title = snapshot.data['title'],
        example = snapshot.data['examples'];

  GrammarData.fromMap(Map<String, dynamic> map)
      : note = map['note'],
        id = map['id'],
        isFav = map['isFav'],
        chapter = map['chapter'],
        hiragana = map['hiragana'],
        myanmar = map['myanmar'],
        title = map['title'],
        example = json.decode(map['examples']);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "chapter": chapter,
      "title": title,
      "note": note ?? "",
      "hiragana": hiragana,
      "myanmar": myanmar,
      "examples": json.encode(example)
    };
  }
}
