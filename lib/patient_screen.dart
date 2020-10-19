import 'package:docto_call_test/pages/call_page.dart';
import 'package:docto_call_test/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'medimate_logo.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  String doctorFrom;


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


    // setState(() {
    String pID = "patient";
    databaseReference = databaseReference.child(pID);
    // });
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: databaseReference.onChildAdded,
              builder: (context, snapshot) {
                if (snapshot.hasData)  {
                  databaseReference.once().then((DataSnapshot datasnap){
                    if(datasnap !=null){
                      setState(() {
                        Map<dynamic, dynamic> values=datasnap.value;
                        doctorFrom = values["Doctor"].toString();
                      });
                    }

                  });
                  _playsound();
                  return Expanded(
                    child: Material(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Center(
                                child: MedimateLogo(
                                  width: 300,
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.account_circle,
                              color: Colors.blue,
                              size: 200,
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Incoming Call From ${doctorFrom}",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red, fontSize: 30),
                            ),
                            Spacer(),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      database.deleteData();
                                      _stopsound();
                                      Navigator.pop(context);


                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: Icon(
                                        Icons.call_end,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      String channelName = "kkk";
                                      database.deleteData();
                                      // AudioManager.instance.stop();
                                      _stopsound();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => CallPage(channelName)),
                                      );


                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                      child: Icon(
                                        Icons.call,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          child: Center(child: CircularProgressIndicator())),
                      SizedBox(height: 20),
                      Card(
                        color: Colors.grey,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "No Call Yet",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
