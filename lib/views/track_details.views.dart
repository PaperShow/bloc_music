import 'package:bloc_music_lyrics/bloc/music_bloc.dart';
import 'package:bloc_music_lyrics/services/connection_services.dart';
import 'package:bloc_music_lyrics/services/musiclyric_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/musiclyrics_bloc.dart';
import '../services/music.services.dart';

class TrackDetailPage extends StatelessWidget {
  const TrackDetailPage({Key? key, required this.trackid}) : super(key: key);

  final int trackid;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MusiclyricsBloc(
            trackid,
            RepositoryProvider.of<MusicLyricServices>(context),
          )..add(LoadLyricApiEvent()),
        ),
        BlocProvider(
          create: (context) => MusicBloc(
            RepositoryProvider.of<MusicServices>(context),
            RepositoryProvider.of<ConnectivityService>(context),
          )..add(LoadApiEvent()),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<MusiclyricsBloc, MusiclyricsState>(
            builder: (context, state) {
              if (state is MusicLyricsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is MusicLyricsLoadedState) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TrackName',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          'Track Artist',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'Lyrics',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          state.lyrics.lyricsBody,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
