import 'package:flutter/material.dart';
import 'package:learn_jp/DAO/exercise.dart';

class CustomRadio extends StatefulWidget {
  final Ex ex;
  final int index, total;
  CustomRadio(this.ex, {this.total, this.index});
  @override
  createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = [];
  String buttonText = "Answer Now";
  bool isRight = false;
  final buttons = ["A", "B", "C", "D"];
  final style =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.ex.ans.length; i++) {
      sampleData.add(RadioModel(
          buttonText: buttons[i], isSelected: false, text: widget.ex.ans[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
                "Choose the correct answer in the following.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(
                "1.${widget.ex.text}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: sampleData.map(
                (f) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        sampleData
                            .forEach((element) => element.isSelected = false);
                        f.isSelected = true;
                      });
                    },
                    child: RadioItem(f),
                  );
                },
              ).toList(),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
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

  check() {
    var rm = sampleData.where((radioModel) => radioModel.isSelected);
    if (rm.isEmpty) {
      print("Select");
    } else {
      if (rm.first.text == widget.ex.correct) {
        setState(() {
          buttonText = "Right Answer!";
          isRight = true;
        });
      } else {
        setState(() {
          buttonText = "Wrong Answer!";
          isRight = false;
        });
      }
    }
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 40.0,
            width: 40.0,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Colors.redAccent : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.redAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(_item.text),
            ),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;
  RadioModel({this.isSelected, this.buttonText, this.text});
}
