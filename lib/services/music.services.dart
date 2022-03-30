import 'dart:convert';
import 'package:bloc_music_lyrics/models/music_list.dart';
import 'package:bloc_music_lyrics/models/music_lyric.dart';
import 'package:http/http.dart' as http;

class MusicServices {
  Future<MusicList> getMusicList() async {
    final response = await http.get(Uri.parse(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7'));
    if (response.statusCode == 200) {
      var jsonMap = jsonDecode(response.body);
      return MusicList.fromJson(jsonMap);
    } else {
      throw Exception();
    }
  }
}
