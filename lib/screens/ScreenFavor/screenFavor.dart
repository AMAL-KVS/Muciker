import 'package:flutter/material.dart';

class Favor extends StatefulWidget {
  const Favor({Key? key}) : super(key: key);

  @override
  State<Favor> createState() => _FavorState();
}

class _FavorState extends State<Favor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 23),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 47, 44),
        centerTitle: true,
        title: Text('F a v o u r i t e s'),
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: SizedBox(
        child: Container(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: Image.asset('assets/images/playlist.jpg'),
                    title: Text(
                      'Favor Song Name',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                      color: Color.fromARGB(255, 255, 6, 6),
                    ),
                    tileColor: Color.fromARGB(255, 29, 28, 27),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
