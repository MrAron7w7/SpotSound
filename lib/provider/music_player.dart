import 'package:audioplayers/audioplayers.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final OnAudioQuery _audioQuery = OnAudioQuery();
  List<SongModel> songs = [];
  int currentIndex = 0;

  Future<void> getSongs() async {
    songs = (await _audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    ))
        .cast<SongModel>();
  }

  Future<void> playMusic(int index) async {
    await _audioPlayer.stop();
    currentIndex = index;
    await _audioPlayer.play(UrlSource(songs[index].uri));
  }

  Future<void> pauseMusic() async {
    await _audioPlayer.pause();
  }

  Future<void> stopMusic() async {
    await _audioPlayer.stop();
  }

  bool isPlaying() {
    return _audioPlayer.state == PlayerState.playing;
  }
}

class SongModel {
  final String title;
  final String artist;
  final String uri;

  SongModel(this.title, this.artist, this.uri);
}
