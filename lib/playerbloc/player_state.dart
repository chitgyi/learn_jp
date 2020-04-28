import 'package:equatable/equatable.dart';
import 'package:learn_jp/Lyrics/lyric.dart';

abstract class PlayerState extends Equatable {
  @override
  List<Object> get props => [];
}

class PlayerInitlize extends PlayerState {}

class PlayerLoading extends PlayerState {}

class PlayerReadyState extends PlayerState {
  final String audioPath;
  final List<Lyric> lyrics;
  PlayerReadyState({this.audioPath, this.lyrics});
  @override
  List<Object> get props => [audioPath, lyrics];
}

class PlayerErrorState extends PlayerState {
  final String errMsg;
  PlayerErrorState(this.errMsg);
}
