import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player/functions/functions.dart';

import 'package:music_player/screens/screenHome/screenPlay/screenPlay.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MiniPlayer extends StatefulWidget {
  int index;
  List<Audio> audiosongs = [];

  MiniPlayer({Key? key, required this.index, required this.audiosongs})
      : super(key: key);

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  AssetsAudioPlayer assetsaudioplayer = AssetsAudioPlayer.withId('0');
  bool prevvisible = true;
  bool nxtvisible = true;

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
    buttondesable();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return assetsaudioplayer.builderCurrent(
        builder: (context, Playing? playing) {
      final myAudio = find(audiosongs, playing!.audio.assetAudioPath);
      return SizedBox(
          height: size.height * 0.12,
          child: ListTile(
            tileColor: const Color.fromARGB(255, 49, 50, 51),
            contentPadding: const EdgeInsets.only(bottom: 15, left: 5, top: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: QueryArtworkWidget(
              id: int.parse(myAudio.metas.id!),
              artworkFit: BoxFit.fill,
              artworkBorder: BorderRadius.circular(30),
              type: ArtworkType.AUDIO,
              nullArtworkWidget: ClipOval(
                child: Image.asset(
                  'assets/images/recent.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ScreenPlay(index: widget.index, myaudiosong: audiosongs),
              ));
            },
            title: Marquee(
              text: myAudio.metas.title.toString(),
              pauseAfterRound: const Duration(seconds: 3),
              velocity: 30,
              blankSpace: 50,
              style: const TextStyle(
                  fontFamily: "poppinz",
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prevvisible
                    ? Visibility(
                        visible: prevvisible,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.index = widget.index + 1;
                                if (widget.index != audiosongs.length - 1) {
                                  nxtvisible = true;
                                }
                                assetsAudioPlayer.previous();
                              });
                            },
                            icon: const Icon(
                              Icons.skip_previous_sharp,
                              color: Colors.white,
                              size: 30,
                            )),
                      )
                    : const SizedBox(
                        width: 30,
                      ),
                PlayerBuilder.isPlaying(
                    player: assetsAudioPlayer,
                    builder: (context, isPlaying) {
                      return GestureDetector(
                        onTap: () async {
                          await assetsAudioPlayer.playOrPause();
                        },
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                      );
                    }),
                nxtvisible
                    ? Visibility(
                        visible: nxtvisible,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.index = widget.index + 1;
                                if (widget.index > 0) {
                                  prevvisible = true;
                                }
                                assetsAudioPlayer.next();
                              });
                            },
                            icon: const Icon(
                              Icons.skip_next_sharp,
                              color: Colors.white,
                              size: 30,
                            )),
                      )
                    : const SizedBox(
                        width: 30,
                      )
              ],
            ),
          ));
    });
  }
}
