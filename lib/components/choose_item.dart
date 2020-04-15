import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final Map<String, dynamic> questions;
  CustomRadio(this.questions);
  @override
  createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData;
  final style =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    var q = widget.questions['choose'] as List;
    sampleData = q
        .map((f) => RadioModel(
            isSelected: false, buttonText: f.keys.first, text: f[f.keys.first]))
        .toList();
  }

  String buttonText = "Answer Now";
  bool isRight = false;
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
                "1.${widget?.questions['title']}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: sampleData.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        sampleData
                            .forEach((element) => element.isSelected = false);
                        sampleData[index].isSelected = true;
                      });
                    },
                    child: RadioItem(sampleData[index]),
                  );
                },
              ),
            ),
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
                        SizedBox(width: 10,),
                        Text(
                          buttonText,
                          style: style,
                        ),
                        Spacer(),
                        Text(
                          "1/26",
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
      if (rm.first.buttonText == widget.questions['answer']) {
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
