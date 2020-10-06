import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioUrl extends StatelessWidget {
  Widget build(BuildContext context) {
    var a = AudioPlayer();
    var p = AudioCache(fixedPlayer: a);
    var playIcon = Icon(
      Icons.play_circle_outline,
      size: 30,
      color: Colors.white,
    );

    var pauseIcon = Icon(
      Icons.pause_circle_outline,
      size: 30,
      color: Colors.white,
    );
    var stopIcon = Icon(
      Icons.stop,
      size: 30,
      color: Colors.white,
    );
    var playButton = RaisedButton(
        color: Colors.redAccent,
        onPressed: () => a.play(
            'https://flutter1709.s3.ap-south-1.amazonaws.com/Ed-Sheeran-Shape-of-You.mp3'),
        child: playIcon);
    var pauseButton = RaisedButton(
      color: Colors.redAccent,
      onPressed: () => a.pause(),
      child: pauseIcon,
    );
    var stopButton = RaisedButton(
      color: Colors.redAccent,
      onPressed: () => a.stop(),
      child: stopIcon,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('URL Audio Player'),
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
        body: Container(
          alignment: Alignment.bottomCenter,
          height: double.infinity,
          width: double.infinity,
          color: Colors.blueGrey,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                playButton,
                Container(
                  width: 10,
                ),
                pauseButton,
                Container(
                  width: 10,
                ),
                stopButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
