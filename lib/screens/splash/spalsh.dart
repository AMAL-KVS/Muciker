import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/functions/functions.dart';
import 'package:music_player/screens/screenHome/screenHome.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchingsongs();
    gotoHome();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 200,
        left: 90,
      ),
      child: Scaffold(
        backgroundColor: Color(131415),
        body: Column(
          children: [
            Image.asset(
              'assets/images/logo-removebg-preview.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'HIT YOUR FAVOR',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => ScreenHome(
              audiosongs: audiosongs,
            )));
  }
}
