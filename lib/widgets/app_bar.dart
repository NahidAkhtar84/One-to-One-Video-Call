import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
//import 'package:agora_rtc_engine/rtc_engine.dart';

class StatusBar extends StatefulWidget {
  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  bool micStatus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
                      child: IconButton(
              icon: micStatus ? Icon(Icons.mic_off, color: Colors.blue,) : Icon(Icons.mic, color: Colors.blue) ,
              onPressed: toggleMute,
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 40,
            child: IconButton(
              icon: Icon(Icons.call_end, color: Colors.white,), 
              onPressed: disconnectCall,
            )
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              icon: Icon(Icons.switch_camera, color: Colors.blue,),
              onPressed: toggleCamera,

            )
          ),
        ],
      ),
      
    );
  }
  void toggleMute(){
    setState(() {
      micStatus = !micStatus;
    });
    AgoraRtcEngine.muteLocalAudioStream(micStatus);
  }
  void toggleCamera(){
    AgoraRtcEngine.switchCamera();
  }
  void disconnectCall(){
    Navigator.pop(context);
  }
}