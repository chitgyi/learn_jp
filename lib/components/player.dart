import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learn_jp/Lyrics/lyric.dart';
import 'package:learn_jp/Lyrics/lyric_controller.dart';
import 'package:learn_jp/Lyrics/lyric_widget.dart';
import 'package:learn_jp/playerbloc/player_bloc.dart';
import 'package:provider/provider.dart';

class Player extends StatefulWidget {
  final bool play;
  String audioPath;
  List<Lyric> lyrics;
  Player(this.play, {this.audioPath, this.lyrics});
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  Duration duration = Duration(milliseconds: 0);
  LyricController controller = LyricController();
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    var audioPlayer = Provider.of<AudioPlayer>(context);
    audioPlayer.play(widget.audioPath, isLocal: false);
    return Container(
      height: 150,
      child: Material(
        color: Colors.redAccent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            widget.play
                ? Expanded(
                    child: LyricWidget(
                      size: Size(double.infinity, double.infinity),
                      lyrics: widget.lyrics,
                      controller: controller,
                      currLyricStyle: TextStyle(color: Colors.white),
                      lyricStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  )
                : Text("No Lyric"),
            Row(
              children: <Widget>[
                // Material(
                //   color: Colors.transparent,
                //   child: InkWell(
                //     borderRadius: BorderRadius.circular(3),
                //     onTap: () {},
                //     child: Padding(
                //       padding: const EdgeInsets.only(right: 5, left: 10),
                //       child: Icon(
                //         Icons.cloud_download,
                //         color: Colors.white,
                //         size: 27,
                //       ),
                //     ),
                //   ),
                // ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(3),
                    onTap: () async {
                      setState(() {
                        isPlay = !isPlay;
                      });
                      try {
                        isPlay
                            ? await audioPlayer.resume()
                            : await audioPlayer.pause();
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 5),
                      child: Icon(
                        isPlay ? Icons.pause : Icons.stop,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                StreamBuilder<Duration>(
                    initialData: duration,
                    stream: audioPlayer.onDurationChanged,
                    builder: (_, durationSanp) {
                      duration = durationSanp.data;

                      return StreamBuilder<Duration>(
                          initialData: Duration(),
                          stream: audioPlayer.onAudioPositionChanged,
                          builder: (_, sanp) {
                            controller.progress = sanp.data;
                            return Expanded(
                              child: Slider(
                                activeColor: Colors.white,
                                value: sanp.data.inMilliseconds.toDouble() >
                                        duration.inMilliseconds.toDouble()
                                    ? 0.0
                                    : sanp.data.inMilliseconds.toDouble(),
                                max: duration.inMilliseconds.toDouble(),
                                onChangeEnd: (d) {
                                  if (duration > sanp.data) {
                                    audioPlayer.seek(
                                        Duration(milliseconds: d.toInt()));
                                  }
                                },
                                onChanged: (d) {},
                              ),
                            );
                          });
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
