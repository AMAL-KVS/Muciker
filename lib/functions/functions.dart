import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/model/Box_Class.dart';
import 'package:music_player/model/Hive_Model.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<SongModel> allSongs = [];
final box = Boxes.getinstance();

final _audioquery = OnAudioQuery();
List<Audio> audiosongs = [];
List<LoacalSongs> mappedsongs = [];
List<LoacalSongs> databaseSong = [];
List? databasesongs = [];

fetchingsongs() async {
  bool ispermission = await _audioquery.permissionsStatus();
  if (!ispermission) {
    await _audioquery.permissionsRequest();
  }
  allSongs = await _audioquery.querySongs();
  mappedsongs = allSongs
      .map((e) => LoacalSongs(
          title: e.title,
          artist: e.artist,
          id: e.id,
          duration: e.duration,
          uri: e.uri!))
      .toList();

  await box.put("musics", mappedsongs);
  databaseSong = box.get("musics") as List<LoacalSongs>;

  databaseSong.forEach((element) {
    audiosongs.add(Audio.file(element.uri.toString(),
        metas: Metas(
            title: element.title,
            id: element.id.toString(),
            artist: element.artist)));
  });
}

Audio find(List<Audio> sourse, String fromPath) {
  return sourse.firstWhere((element) => element.path == fromPath);
}

AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId('0');

// List playlists = [];
// String? playlistName
