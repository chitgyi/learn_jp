import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/exercise.dart';
import 'package:learn_jp/components/arrange_item.dart';
import 'package:learn_jp/components/blank_item.dart';
import 'package:learn_jp/components/choose_item.dart';

class Exercise extends StatelessWidget {
  final int chId;
  Exercise(this.chId);

  Future<List<DocumentSnapshot>> getExercises() async {
    var snapshots = await Firestore.instance
        .collection("exercises")
        .where("chapter", isEqualTo: (chId + 1).toString())
        .getDocuments();
    return snapshots.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text("Exercises"),
        titleSpacing: 0,
      ),

      body: FutureBuilder(
        future: getExercises(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              var docs = snapshot.data as List<DocumentSnapshot>;
              var ex = docs.map((f) => Ex.fromMap(f)).toList();
              if (ex.isEmpty) {
                return Center(
                  child: Text("Empty"),
                );
              }
              return _exerciseList(ex);
              break;
            case ConnectionState.none:
              return Center(
                child: Text("Check your internet connection!"),
              );
              break;
            default:
              return Center(
                child: Text("Check your internet connection!"),
              );
          }
        },
      ),
      // body: ListView.builder(
      //    // padding: EdgeInsets.only(bottom: 60),
      //     itemCount: questions.length,
      //     itemBuilder: (cxt, index) => CustomRadio(questions[index],index: index+1, total: questions.length,)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       FloatingActionButton(
      //         heroTag: null,
      //         backgroundColor: Colors.grey,
      //         onPressed: () {},
      //         child: Icon(Icons.navigate_before),
      //       ),
      //       FloatingActionButton(
      //         heroTag: null,
      //         onPressed: () {},
      //         child: Icon(Icons.navigate_next),
      //       )
      //     ],
      //   ),
      // )
    );
  }

  Widget _exerciseList(List<Ex> ex) {
    return ListView.builder(
        itemCount: ex.length,
        itemBuilder: (context, index) {
          if (ex[index].type == "blank") {
            return BlankItem(
              index: index + 1,
              total: ex.length,
              text: ex[index].text,
              correct: ex[index].correct,
            );
            // return Text("${ex[index].text}\n${ex[index].correct}");
          } else if (ex[index].type == "choice") {
            return CustomRadio(
              ex[index],
              index: index + 1,
              total: ex.length,
            );
            // return Text(
            //     "${ex[index].text}\n${ex[index].ans[0]}\n${ex[index].ans[1]}\n${ex[index].ans[2]}\n ${ex[index].correct}");
          } else if (ex[index].type == "arrange") {
            return ArrangeItem(
              ex: ex[index],
              index: index + 1,
              total: ex.length,
            );
          } else {
            return Center(
              child: Text("Empty"),
            );
          }
        });
  }
}
