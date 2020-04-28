import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_jp/db/MoorHelper.dart';
import 'package:learn_jp/playerbloc/player_bloc.dart';
import 'package:learn_jp/screens/App.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final db = AppDb();

  @override
  Widget build(BuildContext context) {
    Firestore.instance.settings(persistenceEnabled: true);
    return MultiProvider(
      providers: [
        Provider<AppDb>(
          create: (_) => db,
        ),
        Provider<AudioPlayer>(
          create: (_) => AudioPlayer(mode: PlayerMode.MEDIA_PLAYER),
        )
      ],
      child: BlocProvider<PlayerBolc>(
        create: (_) => PlayerBolc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Color.fromRGBO(245, 41, 40, 1),
              accentColor: Colors.redAccent),
          home: App(),
        ),
      ),
    );
  }
}
