import 'package:flutter/material.dart';

class PageAnimation extends PageRouteBuilder {
  final Widget child;
  PageAnimation({this.child})
      : super(
            transitionsBuilder: (context, animation, secondAnimation, widget) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInToLinear);
              return ScaleTransition(
                alignment: Alignment.topLeft,
                scale: animation,
                child: widget,
              );
            },
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (cxt, animation, secondAnimation) {
              return child;
            });
}
