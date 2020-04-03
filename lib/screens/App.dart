import 'package:flutter/material.dart';
import 'package:learn_jp/components/styling.dart';
import 'package:learn_jp/screens/Learn.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LEARN-JP"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                  elevation: 4,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (cxt) => Learn()));
                      },
                      child: Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.chrome_reader_mode,
                                  color: Colors.redAccent),
                              Text(
                                "Learn",
                                style: titleTextSyle,
                              )
                            ],
                          )))),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "News",
                  style: title2TextSyle,
                ),
              ),
              Card(
                elevation: 4,
                child: Row(
                  children: <Widget>[
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTCwkbNJ_AGRt2y8hLaOE6yIymyNww3MQOvpzkeVoikg7lNtHPU",
                      fit: BoxFit.fill,
                      width: 120,
                      height: 120,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Breaking news, opinion, in-depth stories on politics,vergf fgsdfgsdf sdfg business, society, sports, Cool Japan, culture, arts, entertainment, more.",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTCwkbNJ_AGRt2y8hLaOE6yIymyNww3MQOvpzkeVoikg7lNtHPU",
                        fit: BoxFit.fill,
                        width: 120,
                        height: 120,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Breaking news, opinion, in-depth stories on politics,vergf fgsdfgsdf sdfg business, society, sports, Cool Japan, culture, arts, entertainment, more.",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]));
  }
}
