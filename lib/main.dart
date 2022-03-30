import 'package:bloc_music_lyrics/services/connection_services.dart';
import 'package:bloc_music_lyrics/services/musiclyric_services.dart';
import 'package:bloc_music_lyrics/views/musiclist.views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/music.services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => MusicServices(),
        ),
        RepositoryProvider(
          create: (context) => MusicLyricServices(),
        ),
        RepositoryProvider(
          create: (context) => ConnectivityService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MusicListViews(),
      ),
    );
  }
}
