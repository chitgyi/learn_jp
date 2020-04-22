import 'package:flutter/material.dart';

class BlankItem extends StatefulWidget {
  final int index, total;
  final String text, correct;

  BlankItem({this.index, this.total, this.text, this.correct});

  @override
  _BlankItemState createState() => _BlankItemState();
}

class _BlankItemState extends State<BlankItem> {
  bool isRight = false;
  String buttonText = "Answer Now";

  final style =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(7),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(
                "Fill the correct answer in the following.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(
                "${widget.index}. ${widget.text}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
                child: Center(
                    child: Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Answer"),
                controller: _controller,
                textAlign: TextAlign.center,
              ),
              width: 100,
              height: 60,
            ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Material(
                elevation: 4,
                color: isRight ? Colors.green : Colors.redAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: check,
                  onDoubleTap: showAns,
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showAns() {
    _controller.text = widget.correct;
    setState(() {
      isRight = true;
      buttonText = "Correct Answer!";
    });
  }

  void check() {
    if (widget.correct == _controller.text) {
      setState(() {
        isRight = true;
        buttonText = "Right Answer!";
      });
    } else {
      setState(() {
        isRight = false;
        buttonText = "Wrong Answer!";
      });
    }
  }
}
