import 'package:firebase_database/firebase_database.dart';

    Database database = Database();
    var databaseReference = FirebaseDatabase().reference().child('callModule').child("Patient");
class Database {
  dynamic result = "";
  void createData(String pID, String aID, String doctorName) {
    databaseReference.child(pID).once().then((DataSnapshot snapshot){
    // print("hehehehehehehhehe");
    // print(snapshot.value);
    //   Map<dynamic, dynamic> values=snapshot.value;
    //   print(values["Name"]);

      if(snapshot.value == null){
        print("hehehehehehehhehe");
        // print("value is" + snapshot.value);
        databaseReference.child("${pID}").set(
            {
              'appointment_id': "${aID}",
              'call_status': "called",
              'patient_id': "${pID}",
              'Doctor': "${doctorName}",
            }
        );
      }
      else{
        print("hohohohohohohohoho");
        print("value is" + snapshot.value);
      }
    });
  }

  deleteData() {
    databaseReference.remove();
  }
}
