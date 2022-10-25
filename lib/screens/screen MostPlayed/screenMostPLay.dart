import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenMostPlay extends StatefulWidget {
  const ScreenMostPlay({Key? key}) : super(key: key);

  @override
  State<ScreenMostPlay> createState() => _ScreenMostPlayState();
}

class _ScreenMostPlayState extends State<ScreenMostPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text('M o s t  P l a y e d'),
        backgroundColor: Color.fromARGB(255, 48, 47, 44),
      ),
    );
  }
}
