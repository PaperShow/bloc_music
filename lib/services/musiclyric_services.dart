import 'dart:convert';

import '../models/music_lyric.dart';
import 'package:http/http.dart' as http;

class MusicLyricServices {
  Future<MusicLyric> getMusicLyrics(int trackid) async {
    final response = await http.get(Uri.parse(
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackid&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7'));
    if (response.statusCode == 200) {
      var jsonMap = jsonDecode(response.body);
      return MusicLyric.fromJson(jsonMap);
    } else {
      throw Exception();
    }
  }
}
