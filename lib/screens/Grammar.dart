import 'package:flutter/material.dart';
import 'package:learn_jp/components/styling.dart';

class Grammar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grammar"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.featured_play_list),
          color: Colors.white,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {},
        )
      ]),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "1. ~ ဖြစ်ပါသည်",
                    style: title2TextSyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "--- は --- です \n ---wa --- desu\n---သည်/က---ဖြစ်ပါသည်။"),
                ),
                Divider(
                  thickness: 1.3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "わたし は ミラー です。\nwatashi wa mira- desu. \mကျွန်တော်က နီလာဖြစ်ပါတယ်။"),
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
