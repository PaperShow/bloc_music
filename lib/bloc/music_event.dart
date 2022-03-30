part of 'music_bloc.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object> get props => [];
}

class LoadApiEvent extends MusicEvent {
  @override
  List<Object> get props => [];
}

class NoInternetEvent extends MusicEvent {
  @override
  List<Object> get props => [];
}
