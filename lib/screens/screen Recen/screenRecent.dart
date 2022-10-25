import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenRecent extends StatefulWidget {
  const ScreenRecent({Key? key}) : super(key: key);

  @override
  State<ScreenRecent> createState() => _ScreenRecentState();
}

class _ScreenRecentState extends State<ScreenRecent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 48, 47, 44),
        title: Text('R e c e n t s'),
        toolbarHeight: 100,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
