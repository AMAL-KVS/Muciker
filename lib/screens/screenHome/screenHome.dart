import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/functions/functions.dart';
import 'package:music_player/screens/ScreenFavor/screenFavor.dart';
import 'package:music_player/screens/ScreenPlaylist/playlist.dart';
import 'package:music_player/screens/screen%20MostPlayed/screenMostPLay.dart';
import 'package:music_player/screens/screen%20Recen/screenRecent.dart';
import 'package:music_player/screens/screenHome/widget/drawer.dart';
import 'package:music_player/screens/screenHome/widget/miniPlayer.dart';
import 'package:music_player/widgets/playMyAudio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key, required this.audiosongs}) : super(key: key);
  List<Audio> audiosongs = [];

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    // TODO: implement initState
    databasesongs = box.get('musics');
    // requstPermission();
  }

  // void requstPermission() {
  //   Permission.storage.request();
  // }

  // PlaySong(String? uri) {
  //   try {
  //     _adudioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
  //     _adudioPlayer.play();
  //   } on Exception {
  //     log("Error Parsing");
  //   }
  // }

  final _audioQuery = new OnAudioQuery();
  final _adudioPlayer = new AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          toolbarHeight: 120,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 36, 35, 34),
          title: Column(
            children: [
              Image.asset(
                'assets/images/logo-removebg-preview.png',
                width: 100,
                height: 100,
              ),
              Text(
                'H o m e',
                style: TextStyle(
                  color: Color.fromARGB(255, 243, 243, 243),
                ),
              )
            ],
          ),
          elevation: 0,
        ),
        backgroundColor: const Color(090808),
        body: Column(
          children: [
            Container(
                width: 500,
                height: 251,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100)),
                    color: Color.fromARGB(255, 36, 35, 34)),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          child: Container(
                            width: 150,
                            height: 50,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Image.asset('assets/images/playlist.jpg'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'P l a y l i s t',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => PlayList()));
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          child: Container(
                            width: 150,
                            height: 50,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Image.asset('assets/images/favori.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'F a v o r i s t s',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => Favor()));
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          child: Container(
                            height: 50,
                            width: 150,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Image.asset('assets/images/recent.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'R e c e n t',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ScreenRecent()));
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          child: Container(
                            height: 50,
                            width: 150,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Image.asset('assets/images/most.jpg'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'M o s t   P l a y e d',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ScreenMostPlay()));
                          },
                        ),
                      ],
                    ))
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            Text(
              'A L L   S O N G S',
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: FutureBuilder<List<SongModel>>(
                  future: _audioQuery.querySongs(
                    sortType: null,
                    orderType: OrderType.ASC_OR_SMALLER,
                    uriType: UriType.EXTERNAL,
                    ignoreCase: true,
                  ),
                  builder: (context, item) {
                    if (item.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (item.data!.isEmpty) {
                      return Text('No songs found');
                    }
                    return ListView.builder(
                        itemCount: item.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {
                                  showBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      // elevation: 20,
                                      // backgroundColor: Colors.blueGrey.withOpacity(0.8),
                                      backgroundColor: Colors.blue,
                                      context: context,
                                      builder: (ctx) => MiniPlayer(
                                            index: index,
                                            audiosongs: audiosongs,
                                          ));

                                  PlayMyAudio(
                                    allsongs: widget.audiosongs,
                                    index: index,
                                    audios: audiosongs,
                                  ).openAsset(index: index, audios: audiosongs);
                                },
                                leading: QueryArtworkWidget(
                                  id: item.data![index].id,
                                  type: ArtworkType.AUDIO,
                                  nullArtworkWidget: Image.asset(
                                    'assets/images/favori.png',
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    item.data![index].displayNameWOExt,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white),
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ),
                                ),
                              ));
                        });
                  }),
            ),
          ],
        ),
        drawer: const Drawers());
  }
}
