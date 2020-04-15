import 'package:flutter/material.dart';
import 'package:learn_jp/animation/PageAnimation.dart';

class LearnItem extends StatelessWidget {
  final Function onPress;
  final Map<String, dynamic> detail;
  LearnItem({@required this.onPress, @required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(detail['src']))),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text(
                  detail['title'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.redAccent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(PageAnimation(child: detail['route']));
                    },
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 10),
                      child: Text(
                        "Start Learn",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
