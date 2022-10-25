import 'package:flutter/material.dart';
import 'package:music_player/screens/ScreenFavor/screenFavor.dart';
import 'package:music_player/screens/ScreenPlaylist/playlist.dart';
import 'package:music_player/screens/settings/settings.dart';

class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(239, 46, 48, 48),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: const Text(
                'Favorits',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Favor()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.play_arrow_sharp,
                color: Colors.white,
              ),
              title: const Text(
                'Playlist',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => PlayList()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.mobile_friendly,
                color: Colors.white,
              ),
              title: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Settigs',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Settings()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
