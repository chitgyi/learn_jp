import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/exercise.dart';

class ArrangeItem extends StatefulWidget {
  final Ex ex;
  final int index, total;
  ArrangeItem({this.ex, this.index, this.total});

  @override
  _ArrangeItemState createState() => _ArrangeItemState();
}

class _ArrangeItemState extends State<ArrangeItem> {
  String buttonText = "Answer Now";
  bool isRight = false;
  final style =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
  List<dynamic> answers;
  @override
  void initState() {
    answers = widget.ex.ans;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      padding: EdgeInsets.all(7),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(
                "Arrange the sentences in the following.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  "${widget.index}.${widget.ex.text}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                )),
            Expanded(
              child: ReorderableListView(
                children: widget.ex.ans
                    .map((f) => Card(
                          elevation: 0.5,
                          key: Key(f),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(f),
                                ),
                                Icon(Icons.menu)
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                onReorder: (int oldIndex, int newIndex) {
                  setState(
                    () {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final String item = widget.ex.ans.removeAt(oldIndex);
                      widget.ex.ans.insert(newIndex, item);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Material(
                elevation: 4,
                color: isRight ? Colors.green : Colors.redAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: check,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          buttonText,
                          style: style,
                        ),
                        Spacer(),
                        Text(
                          "${widget.index}/${widget.total}",
                          style: style,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void check() {
    var answer = "";
    widget.ex.ans.forEach((f) => answer = answer + f.toString());
    if (answer == widget.ex.correct) {
      setState(() {
        buttonText = "Right Answer";
        isRight = true;
      });
    } else {
      setState(() {
        buttonText = "Wrong Answer";
        isRight = false;
      });
    }
  }
}
