import 'package:docto_call_test/pages/call_page.dart';
import 'package:docto_call_test/services.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:test_caller_app/src/pages/home_page.dart';
// import 'package:test_caller_app/src/pages/index.dart';

import 'medimate_logo.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: MedimateLogo(
                      width: 300,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 200,
                      ),
                      SizedBox(height: 0),
                      Text(
                        "Patient Istiak",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Call Patient",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 30),
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () async {
                          String pID = "patient";
                          String aID = "appointment";
                          String doctorName = "Fazle Rabbi";
                          database.createData(pID, aID, doctorName);
                          String channelName = "kkk";
                          if (channelName.isNotEmpty) {
                            // await for camera and mic permissions before pushing video page
                            //await _handleCameraAndMic();
                            await PermissionHandler().requestPermissions(
                              [
                                PermissionGroup.camera,
                                PermissionGroup.microphone
                              ],);
                            // push video page with given channel name
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CallPage(channelName),
                              ),
                            );
                          }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => IndexPage()),
                          // );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
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
      ),
    );
  }

}
