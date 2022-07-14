import 'package:bloc/bloc.dart';
import 'package:bloc_music_lyrics/services/musiclyric_services.dart';
import 'package:equatable/equatable.dart';

import '../models/music_lyric.dart';

part 'musiclyrics_event.dart';
part 'musiclyrics_state.dart';

class MusiclyricsBloc extends Bloc<MusiclyricsEvent, MusiclyricsState> {
  final MusicLyricServices _lyricServices;

  MusiclyricsBloc(int trackid, this._lyricServices)
      : super(MusicLyricsLoadingState()) {
    on<MusiclyricsEvent>((event, emit) async {
      emit(MusicLyricsLoadingState());

      final musicLyric = await _lyricServices.getMusicLyrics(trackid);
      emit(MusicLyricsLoadedState(
        lyrics: musicLyric.message.body.lyrics,
      ));
    });
  }
}
