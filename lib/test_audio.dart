import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';

class bodyscan extends StatefulWidget {
  @override
  _bodyscanState createState() => _bodyscanState();
}

enum PlayerState {stopped,playing,paused}

class _bodyscanState extends State<bodyscan> {

  String mp3Uri = "";
    AudioPlayer player = AudioPlayer();
  void _playsound(){
    player.play(mp3Uri);
  }
  void _stopsound(){
    player.stop();
  }

  void _loadsound() async {
    final ByteData data = await rootBundle.load("assets/ringtone.mp3");
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/ringtone.mp');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush:true);
    mp3Uri = tempFile.uri.toString();
  }
  @override
  void initState() {
    _loadsound();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              InkWell(
                enableFeedback: false,
                child :Container (
                  color: Colors.blue,
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Play Sound', style: TextStyle(color: Colors.white),) ,

                ),
                onTap: _playsound,
              ),
              SizedBox(height: 10,),
              InkWell(
                enableFeedback: false,
                child :Container (
                  color: Colors.blue,
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Stop Sound', style: TextStyle(color: Colors.white),),
                ),
                onTap: _stopsound,
              ),
            ],
          ),
        )
    );
  }

}