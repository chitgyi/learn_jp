import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_jp/components/learn_item.dart';
import 'package:learn_jp/components/news.dart';
import 'package:learn_jp/screens/Kanji.dart';
import 'package:learn_jp/screens/Learn.dart';
import 'package:learn_jp/screens/Listening.dart';
import 'package:learn_jp/utils/DbHelper.dart';

class App extends StatelessWidget {
  final learns = [
    {
      "src": "assets/onbarad1.png",
      "route": Learn(),
      "title": "Vocabulary, Grammar and Exercise"
    },
    {"src": "assets/onbarad2.png", "route": Kanji(), "title": "Kanji"},
    {"src": "assets/listening.png", "route": Listening(), "title": "Listening"}
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 35),
                width: width,
                height: height / 3.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/png/appbar2.png",
                        ),
                        fit: BoxFit.fill)),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/png/menu.png",
                        width: 35,
                        height: 40,
                        fit: BoxFit.fill,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 10),
                      title: Text(
                        "Learn Japanese Language",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                )),
            Container(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: (height / 3) - 70),
                  ),
                  // Container(
                  //   height: 300,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (cxt, index) => LearnItem(
                  //       detail: learns[index],
                  //       onPress: () {},
                  //     ),
                  //     itemCount: learns.length,
                  //   ),
                  // ),
                  CarouselSlider(
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    height: 300.0,
                    items: learns.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return LearnItem(
                            onPress: () {},
                            detail: i,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            News(
                              icon: Icon(
                                Icons.language,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                // DbHelper().createTables(await DbHelper.access());
                              },
                              text: Text("Language"),
                            ),
                            News(
                              icon: Icon(
                                Icons.collections_bookmark,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {},
                              text: Text("Book Mark"),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            News(
                              icon: Icon(
                                Icons.language,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {},
                              text: Text("Language"),
                            ),
                            News(
                              icon: Icon(
                                Icons.fiber_new,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {},
                              text: Text("News"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
