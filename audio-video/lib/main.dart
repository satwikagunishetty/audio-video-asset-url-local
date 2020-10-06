import 'package:assets_app/audiourl.dart';
import 'package:flutter/material.dart';
import 'package:assets_app/assetaudio.dart';
import 'package:assets_app/video.dart';
import 'package:assets_app/audiofile.dart';
import 'package:assets_app/home.dart';
import 'package:assets_app/videourl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "assetaudio": (context) => MyAudio(),
        "video": (context) => VideoApp(),
        "audiofile": (context) => AudioFile(),
        "home": (context) => Home(),
        "videourl": (context) => ChewieDemo(),
        "audiourl":(context)=>AudioUrl(),
      },
    );
  }
}
