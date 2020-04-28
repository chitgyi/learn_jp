import 'package:equatable/equatable.dart';

abstract class PlayerEvent extends Equatable {
  @override
  List<String> get props => [];
}

class PlayEvent extends PlayerEvent {
  final String audioUrl;
  final String lrcUrl;
  PlayEvent({this.audioUrl, this.lrcUrl});
   @override
  List<String> get props => [audioUrl, lrcUrl];
}
