import 'package:cloud_firestore/cloud_firestore.dart';

class Ex {
  final String id;
  String text;
  List<dynamic> ans;
  final String correct;
  final String chapter;
  final String type;

  Ex(
      {this.id, this.text, this.ans, this.chapter, this.correct, this.type});

  Ex.fromMap(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.text = snapshot.data['text'] ?? null,
        this.ans = snapshot.data['ans'] ?? null,
        this.correct = snapshot.data['correct'],
        this.chapter = snapshot.data['chapter'],
        this.type = snapshot.data['type'];
}
