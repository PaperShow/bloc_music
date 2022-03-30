part of 'music_bloc.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class MusicLoadingState extends MusicState {
  // HomeInitial is renamed to HomeLoadingState
  @override
  List<Object> get props => [];
}

class MusicLoadedState extends MusicState {
  final List<TrackList> track;
  // final List<TrackList> trackName;
  // final List<TrackList> albumName;
  // final List<TrackList> artistName;

  const MusicLoadedState({
    required this.track,
  });

  @override
  List<Object> get props => [track];
}

class NoInternetState extends MusicState {
  // HomeInitial is renamed to HomeLoadingState
  @override
  List<Object> get props => [];
}
