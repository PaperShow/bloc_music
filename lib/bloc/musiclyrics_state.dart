part of 'musiclyrics_bloc.dart';

abstract class MusiclyricsState extends Equatable {
  const MusiclyricsState();

  @override
  List<Object> get props => [];
}

class MusicLyricsLoadingState extends MusiclyricsState {
  // HomeInitial is renamed to HomeLoadingState
  @override
  List<Object> get props => [];
}

class MusicLyricsLoadedState extends MusiclyricsState {
  final Lyrics lyrics;
  const MusicLyricsLoadedState({
    required this.lyrics,
  });

  @override
  List<Object> get props => [lyrics];
}
