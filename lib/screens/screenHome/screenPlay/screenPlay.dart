import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/functions/functions.dart';
import 'package:music_player/model/Hive_Model.dart';
import 'package:music_player/screens/screenHome/screenPlay/widget/prograsBar.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ScreenPlay extends StatefulWidget {
  Audio? song;
  List<Audio> myaudiosong = [];

  int index;
  ScreenPlay({
    song,
    required this.myaudiosong,
    required this.index,
    Key? key,
  }) : super(key: key);
  // ScreenPlay({Key? key}) : super(key: key);

  @override
  State<ScreenPlay> createState() => _ScreenPlayState();
}

class _ScreenPlayState extends State<ScreenPlay> {
  int repeat = 0;

  bool prevvisible = true;
  bool nxtvisible = false;

  buttondesable() {
    if (widget.index == 0) {
      prevvisible = false;
    } else {
      prevvisible = true;
    }
    if (widget.index == audiosongs.length - 1) {
      nxtvisible = false;
    } else {
      nxtvisible = true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    databaseSong = box.get('musics') as List<LoacalSongs>;
    assetsAudioPlayer.play();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(85, 73, 73, 77),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 73, 73, 77),
        centerTitle: true,
        title: Text('Song Name'),
        toolbarHeight: 100,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: assetsAudioPlayer.builderCurrent(
          builder: (context, Playing? playing) {
        final myAudio = find(widget.myaudiosong, playing!.audio.assetAudioPath);
        final currentSong = databaseSong.firstWhere(
            (element) => element.id.toString() == myAudio.metas.id.toString());
        if (playing.audio.assetAudioPath.isEmpty) {
          return Text('Loading...');
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 10),
                child: Container(
                  width: 250,
                  height: 250,
                  child: QueryArtworkWidget(
                    id: int.parse(myAudio.metas.id!),
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: ClipRRect(
                      child: Image.asset('assets/images/playlist.jpg'),
                    ),
                  ),

                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(80),
                  //   child: Image.asset('assets/images/recent.png'),
                  // ),
                ),
              ),
              Text(
                myAudio.metas.artist.toString() == '<unknown>'
                    ? 'unknown Artist'
                    : myAudio.metas.artist.toString(),
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: assetsAudioPlayer.builderRealtimePlayingInfos(
                        builder: (context, infos) {
                      Duration currentposition = infos.currentPosition;
                      Duration totalduration = infos.duration;
                      return ProgressBar(
                          timeLabelTextStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                          thumbColor: Colors.white,
                          baseBarColor: Colors.grey,
                          progressBarColor: Colors.red,
                          bufferedBarColor: Colors.red,
                          thumbRadius: 10,
                          barHeight: 4,
                          progress: currentposition,
                          total: totalduration,
                          onSeek: ((to) {
                            assetsAudioPlayer.seek(to);
                          }));
                    })),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shuffle,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              assetsAudioPlayer.previous();
                            });
                          },
                          icon: Icon(
                            Icons.skip_previous,
                            size: 40,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      PlayerBuilder.isPlaying(
                          player: assetsAudioPlayer,
                          builder: (context, isplaying) {
                            return GestureDetector(
                              onTap: () async {
                                await assetsAudioPlayer.playOrPause();
                              },
                              child: Icon(
                                isplaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 35,
                              ),
                            );
                          }),
                      SizedBox(
                        width: 20,
                      ),

                      IconButton(
                          onPressed: () {
                            setState(() {
                              assetsAudioPlayer.next();
                            });
                          },
                          icon: Icon(
                            Icons.skip_next_sharp,
                            color: Colors.white,
                            size: 40,
                          )),

                      // nxtvisible
                      //     ? Visibility(
                      //         visible: nxtvisible,
                      // child: IconButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         widget.index = widget.index + 1;
                      //         if (widget.index > 0) {
                      //           prevvisible = true;
                      //         }
                      //         assetsAudioPlayer.next();
                      //       });
                      //     },
                      //     icon: Icon(
                      //       Icons.skip_next_sharp,
                      //       color: Colors.white,
                      //     )))
                      //:
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (repeat % 2 == 0) {
                                assetsAudioPlayer.setLoopMode(LoopMode.single);
                                repeat++;
                              } else {
                                assetsAudioPlayer.setLoopMode(LoopMode.none);
                                repeat++;
                              }
                            });
                          },
                          icon: repeat % 2 == 0
                              ? Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.repeat_one_on_sharp,
                                  color: Colors.white,
                                ))
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
