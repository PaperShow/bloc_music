import 'package:bloc_music_lyrics/services/connection_services.dart';
import 'package:bloc_music_lyrics/services/music.services.dart';
import 'package:bloc_music_lyrics/views/track_details.views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/music_bloc.dart';

class MusicListViews extends StatelessWidget {
  const MusicListViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => MusicBloc(
        RepositoryProvider.of<MusicServices>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<MusicBloc, MusicState>(
            builder: (context, state) {
              if (state is NoInternetState) {
                return Center(
                  child: Text('No Internet Connection'),
                );
              }
              if (state is MusicLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is MusicLoadedState) {
                return ListView.builder(
                    itemCount: state.track.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TrackDetailPage(
                                    trackid: state.track[index].track.trackId,
                                  )));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text((index + 1).toString()),
                          ),
                          title: Text(state.track[index].track.trackName),
                          subtitle: Text(state.track[index].track.artistName),
                        ),
                      );
                    });
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
