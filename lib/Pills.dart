//import 'dart:core' as prefix0;
//import 'package:pharmassist/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pharmassist/Animation/FadeAnimation.dart';
import './second.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
// void main() => runApp(MyApp());

// class MyApp1 extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
class MyHomePage1 extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final b=" Please,,Place ,,the,, Bottle";
  @override
  Widget build(BuildContext context) {
    //final FlutterTts flutterTts = FlutterTts();
    Future _speak1() async {
      await flutterTts.speak(b);}
Timer(Duration(seconds: 2), () {
      _speak1();
        });
    return MyHomePage2();
  }
}







class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  String a;

  int count = 0;
  int c = 0, med, tabcount;
  int dayTime, midTime, nightTime, medCount;
  String q = "", medicineName, medicineN;
  String f = "";
  //String b="Place, the ,Bottle";
  var now = new DateTime.now();

  final FlutterTts flutterTts = FlutterTts();

  Future function(String f) async {
    DocumentSnapshot ds =
        await Firestore.instance.collection('pharmassist').document(f).get();
    int time = now.hour.toInt();
    if (time >= 6 && time <= 10) {
      med = ds['Morning'];
    } else if (time >= 11 && time <= 16) {
      med = ds['MidDay'];
    } else if (time >= 19 && time <= 22) {
      med = ds['Night'];
    } else {
      print("error");
    }
    tabcount = ds['Count'];
    medicineName = ds['MedicineName'];
    // dayTime = ds['Morning'];
    // midTime = ds['MidDay'];
    // nightTime = ds['Night'];
    setState(() {
      medicineN = medicineName;
      //medCount = dayTime;
      q = medicineN + ", take " + med.toString() + " pills";
    });

    //print(q);
    //print(medicineName);
    await flutterTts.speak(q);
    Future.delayed(const Duration(milliseconds: 5000), () {
      q = "";
    });
  }

  @override
  Widget build(BuildContext context) {

// Future _speak1() async {
//       await flutterTts.speak(b);}

// Timer(Duration(seconds: 2), () {
//       _speak1();
//           });

    Future _speak() async {
      if (c == count) {
        f = count.toString();

        function(f);
        //print(count.toString() + "2");
        setState(() {
          count = 0;
          c = 0;
        });

        Future.delayed(const Duration(milliseconds: 5000), () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Second(this.med, this.tabcount, this.f)),
          );
        });
      }
    }



    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body:
            /*StreamBuilder(
          stream: Firestore.instance.collection('pharmassist').snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData) 
            return null;
          return*/
            Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FadeAnimation(
                  2.0,
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/2.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[],
                  ),
                ),),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  
                  FadeAnimation(
                    2.0,
                  Text(
                    "Please Place the Bottle",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),),
                  FadeAnimation(
                    2.0,
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    //padding: EdgeInsets.fromLTRB(20,100 ,20, 100),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              // height: 48.70,
                              // width: 48.70,
                              child: GestureDetector(
                                onLongPress: () {
                                  print("1.0");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  // width: MediaQuery.of(context).size.width *
                                  //     0.12,
                                  // height: MediaQuery.of(context).size.height *
                                  //     0.12,
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("1.1");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(""),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("1.2");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("1.3");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("1.4");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("1.5");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("1.6");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("1.7");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("2.0");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("2.1");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("2.2");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("2.3");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("2.4");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("2.5");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("2.6");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("2.7");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("3.0");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("3.1");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("3.2");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("3.3");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("3.4");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("3.5");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("3.6");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("3.7");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.0");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.1");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.2");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.3");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.4");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.5");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.6");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.7");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                          ],
                        ),Row(
                          children: <Widget>[
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.0");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.1");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.2");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.3");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.4");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.5");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.6");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.7");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                          ],
                        ),Row(
                          children: <Widget>[
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.0");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.1");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.2");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.3");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.4");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.5");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.6");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onLongPress: () {
                                  print("4.7");
                                  setState(() {
                                    count++;
                                  });
                                },
                                onLongPressEnd: (int) {
                                  setState(() {
                                    c++;
                                    _speak();
                                  });
                                },
                                child: Container(
                                  height: 48.70,
                                  width: 48.70,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    color: Colors.white,
                                  ),
                                  child: Text(" "),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Center(
                      child: Text(
                        q,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ]
                )
              ],
            ),
          ),
        ));
  }
}
