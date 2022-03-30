part of 'musiclyrics_bloc.dart';

abstract class MusiclyricsEvent extends Equatable {
  const MusiclyricsEvent();

  @override
  List<Object> get props => [];
}

class LoadLyricApiEvent extends MusiclyricsEvent {
  @override
  List<Object> get props => [];
}
