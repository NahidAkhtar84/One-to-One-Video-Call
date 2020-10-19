import 'package:docto_call_test/patient_screen.dart';
import 'package:docto_call_test/services.dart';
import 'package:flutter/material.dart';


import 'clip_and_shadow.dart';
import 'doctor_screen.dart';
import 'medimate_logo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

List<String> signInOptionsName = [
  "PATIENT",
  "DOCTOR",
];

List<String> signInOptionsIconList = [
  "assets/images/Name Icon.png",
  "assets/images/Call a Doctor Icon.png",
];

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Medimate")),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DoctorScreen())),
                      child: CustomPaint(
                        painter: SignInOptionsBoxShadowPainter(),
                        child: ClipPath(
                          clipper: SignInOptionsClip(),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(20),
                            child: Container(
                              height: 150,
                              width: 120,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: Image(
                                      image:
                                      AssetImage(signInOptionsIconList[1]),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      signInOptionsName[1],
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PatientScreen())),
                      child: CustomPaint(
                        painter: SignInOptionsBoxShadowPainter(),
                        child: ClipPath(
                          clipper: SignInOptionsClip(),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(20),
                            child: Container(
                              height: 150,
                              width: 120,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: Image(
                                      image:
                                      AssetImage(signInOptionsIconList[0]),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      signInOptionsName[0],
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: RaisedButton(
                    onPressed: () {
                      database.deleteData();
                    },
                    color: Colors.red,
                    elevation: 5,
                    child: Text(
                      "RESET",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
