import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_jp/Lyrics/lyric_controller.dart';
import 'package:learn_jp/Lyrics/lyric_util.dart';
import 'package:learn_jp/Lyrics/lyric_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lyric Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Lyric'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Duration position = new Duration(seconds: 0);
  Duration duration = new Duration(seconds: 0);
  LyricController controller;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    audioPlayer.play(
        "https://firebasestorage.googleapis.com/v0/b/learnjpmm.appspot.com/o/audio_0.mp3?alt=media&token=b1d7c7f9-df27-4148-af2c-030f61c36797");
    audioPlayer.onDurationChanged.listen((onData) {
      setState(() {
        duration = onData;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((onData) {
      controller.progress = onData;
      setState(() {
        position = onData;
      });
    });
    controller = LyricController(vsync: this, draggingTimerDuration: position);
    super.initState();
  }

  double slider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  FutureBuilder(
                    future: rootBundle.loadString("assets/audio_0.lrc"),
                    builder: (cxt, sanp) {
                      if (sanp.connectionState == ConnectionState.done) {
                        return Center(
                            child: LyricWidget(
                          size: Size(double.infinity, double.infinity),
                          lyrics: LyricUtil.formatLyric(sanp.data),
                          controller: controller,
                        ));
                      } else {
                        return Center(
                          child: Text("No Lyrics"),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Slider(
              onChangeStart: (d) {
                setState(() {
                  slider = d;
                });
              },
              onChangeEnd: (d) {
                
                setState(() {
                  slider = d;
                });
              },
              value: position.inMilliseconds.toDouble(),
              max: duration.inMilliseconds.toDouble(),
              min: 0,
              onChanged: (d) {
                position = Duration(microseconds: d.toInt());
              },
            ),
          ],
        ),
      ),
    );
  }
}
