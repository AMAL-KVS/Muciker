import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/model/Box_Class.dart';
import 'package:music_player/model/Hive_Model.dart';
import 'package:music_player/screens/screenHome/screenHome.dart';
import 'package:music_player/screens/screenHome/screenPlay/screenPlay.dart';
import 'package:music_player/screens/splash/spalsh.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LoacalSongsAdapter());
  await Hive.openBox<List>(boxname);
  final box = Boxes.getinstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'music',
      home: SpalshScreen(),
    );
  }
}
