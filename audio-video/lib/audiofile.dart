import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";

  @override
  void initState() {
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Local Audio'),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "m1.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.contain,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 80,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                    left: MediaQuery.of(context).size.width * 0.15),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    IconButton(
                      color: Colors.white,
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        if (isPlaying) {
                          _audioPlayer.pause();

                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          _audioPlayer.resume();

                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.stop),
                      onPressed: () {
                        _audioPlayer.stop();

                        setState(() {
                          isPlaying = false;
                        });
                      },
                    ),
                    Text(
                      currentTime,
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,),
                    ),
                    Text(" | ",style: TextStyle(
                         color: Colors.white,
                         
                         )),
                    Text(
                      completeTime,
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.audiotrack),
        onPressed: () async {
          String filePath = await FilePicker.getFilePath();

          int status = await _audioPlayer.play(filePath, isLocal: true);

          if (status == 1) {
            setState(() {
              isPlaying = true;
            });
          }
        },
      ),
    );
  }
}
