import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_jp/components/player.dart';
import 'package:learn_jp/playerbloc/player_bloc.dart';
import 'package:learn_jp/playerbloc/player_event.dart';
import 'package:learn_jp/playerbloc/player_state.dart';
import 'package:provider/provider.dart';

class Listening extends StatefulWidget {
  @override
  _ListenState createState() => _ListenState();
}

class _ListenState extends State<Listening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listening"),
        titleSpacing: 0,
      ),
      body: FutureBuilder(
        future: Firestore.instance.collection("listening").getDocuments(),
        builder: (cxt, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snap.connectionState == ConnectionState.done) {
            var data = snap.data as QuerySnapshot;
            if (data != null) {
              var listening = data.documents;

              return ListView.builder(
                padding: EdgeInsets.only(bottom: 155),
                itemBuilder: (cxt, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 5),
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 1,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          context.bloc<PlayerBolc>().add(PlayEvent(
                              audioUrl: listening[index].data['audio'],
                              lrcUrl: listening[index].data['lrc']));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Text(listening[index].data['title'] +
                                  index.toString()),
                              Spacer(),
                              Icon(Icons.play_circle_filled)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: listening.length,
              );
            } else {
              return Center(
                child: Text("Empty"),
              );
            }
          }
          return Container();
        },
      ),
      bottomSheet: Provider<AudioPlayer>(
        create: (_) => AudioPlayer(playerId: "myplayer"),
        child: BlocBuilder<PlayerBolc, PlayerState>(
          builder: (cxt, state) {
            print(state);
            if (state is PlayerLoading) {
              return Player(false);
            }
            if (state is PlayerReadyState) {
              return Player(true,
                  audioPath: state.audioPath, lyrics: state.lyrics);
            }
            return Player(
              false,
            );
          },
        ),
      ),
    );
  }
}
