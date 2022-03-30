import 'package:bloc/bloc.dart';
import 'package:bloc_music_lyrics/services/music.services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../models/music_list.dart';
import '../services/connection_services.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final MusicServices _musicServices;
  final ConnectivityService _connectivityService;

  MusicBloc(this._musicServices, this._connectivityService)
      : super(MusicLoadingState()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('No intrenet here');
        add(NoInternetEvent());
      } else {
        print('intrenet here');
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async {
      emit(MusicLoadingState());

      final musicList = await _musicServices.getMusicList();
      emit(MusicLoadedState(
        track: musicList.message.body.trackList,
      ));
    });

    on<NoInternetEvent>((event, emit) {
      emit(NoInternetState());
    });
  }
}
