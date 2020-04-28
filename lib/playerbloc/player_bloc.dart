import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_jp/Lyrics/lyric.dart';
import 'package:learn_jp/Lyrics/lyric_util.dart';
import 'package:learn_jp/playerbloc/player_event.dart';
import 'package:learn_jp/playerbloc/player_state.dart';

class PlayerBolc extends Bloc<PlayerEvent, PlayerState> {
  final AudioPlayer audioPlayer = AudioPlayer(playerId: "myplayer");
  @override
  PlayerState get initialState => PlayerInitlize();

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    yield PlayerLoading();
    List<Lyric> lrc = LyricUtil.formatLyric(event.props[1]);
    yield PlayerReadyState(audioPath: event.props[0], lyrics: lrc);
  }
}
