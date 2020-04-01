import 'package:flutter/material.dart';
class Initializing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            semanticsLabel: "Initilizing....",
          ),
          Text("Initilizing..........")
        ],
      ),
    ));
  }

 
}
