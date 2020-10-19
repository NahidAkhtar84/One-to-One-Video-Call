import 'dart:ui';

// import 'package:agora_group_calling/widgets/app_bar.dart';
// import 'package:agora_group_calling/widgets/call_function.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:docto_call_test/widgets/app_bar.dart';
import 'package:docto_call_test/widgets/call_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class CallPage extends StatefulWidget {
  final String channelName;
  CallPage(this.channelName);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    backgroundColor: Colors.lightBlue,
    title: Text('Medimate Medicine'),
    elevation: 10,
        ),
        body: Stack(
    // fit: StackFit.expand,
    children: <Widget>[
      VideoCall(widget.channelName),
      Positioned(
        bottom: 10,
        left: 50,
        child: StatusBar(),
      ),
    ],
        ),
        
      );
  }

}