import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class MyPrograsBar extends StatefulWidget {
  const MyPrograsBar({Key? key}) : super(key: key);

  @override
  State<MyPrograsBar> createState() => _MyPrograsBarState();
}

class _MyPrograsBarState extends State<MyPrograsBar> {
  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      thumbGlowColor: Colors.orange,
      baseBarColor: Color.fromARGB(78, 255, 153, 0),
      progressBarColor: Colors.orange,
      thumbColor: Colors.white,
      progress: Duration(milliseconds: 1000),
      buffered: Duration(milliseconds: 2000),
      total: Duration(milliseconds: 5000),
      onSeek: (duration) {
        print('User selected a new time: $duration');
      },
    );
  }
}
