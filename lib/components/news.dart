import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final Icon icon;
  final Text text;
  final Function onPressed;
  News({this.icon, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[icon, text]),
          ),
        ),
      ),
    );
  }
}
