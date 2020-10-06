import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class MyAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var audioplay = AudioPlayer();
    var song = AudioCache(fixedPlayer: audioplay);
    play_song() {
      song.play("mirchi.mp3");
    }

    pause_song() {
      audioplay.pause();
    }

    stop_music() {
      audioplay.stop();
    }

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Mirchi Mirchi......',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Hurray!!!!!!!!!!!',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                onPressed: play_song,
              ),
              IconButton(
                icon: Icon(
                  Icons.pause,
                  color: Colors.black,
                ),
                onPressed: pause_song,
              ),
              IconButton(
                  icon: Icon(
                    Icons.stop,
                    color: Colors.black,
                  ),
                  onPressed: stop_music),
            ],
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Asset Audio Player',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Asset Audio Player'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushNamed(context, "home");
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Image.asset(
              'mirchi.jpg',
              width: 600,
              height: 300,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
          ],
        ),
      ),
    );
  }
}
