import 'dart:math';

import 'package:flutter/material.dart';

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text('p l a y l i s t'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              iconSize: 30,
            )
          ],
          toolbarHeight: 100,
          backgroundColor: Color.fromARGB(255, 48, 47, 44),
          elevation: 0,
        ),
        body: SizedBox(
          child: Container(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      leading: Image.asset('assets/images/playlist.jpg'),
                      title: Text('Playlist Name',
                          style: TextStyle(color: Colors.white)),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                      ),
                      tileColor: Color.fromARGB(255, 29, 28, 27),
                    ),
                  );
                }),
          ),
        ));
  }
}
