import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(239, 46, 48, 48),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(239, 46, 48, 48),
          centerTitle: true,
          title: Text('S e t t i n g s'),
          elevation: 0,
        ),
        body: ListView(
          children: [
            ListTile(
                leading: Icon(
                  Icons.notification_add,
                  color: Colors.white,
                ),
                title: Text(
                  'Notification',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Switch(value: false, onChanged: (ValueKeys) {})),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.white,
              ),
              title: Text('Share', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              title:
                  Text('Privacy Policy', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: Text('About', style: TextStyle(color: Colors.white)),
            )
          ],
        ));
  }
}
