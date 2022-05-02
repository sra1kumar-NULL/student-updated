import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter/services.dart';
class Attendence extends StatefulWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  var attend, perc;
  var textController = TextEditingController();
  Future getAttendence() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/attendences.json');
    attend = json.decode(data);
    setState(() {
      perc = _findAttendence(textController.text, attend);
    });
  }

  void tempAttend() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('roll', '18031A0551');
    final String? roll = prefs.getString('roll');
    textController.text = roll.toString();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await getAttendence();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    tempAttend();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendence", style: TextStyle(color: Colors.white)),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FutureBuilder(
            //   builder: (context, snapshot) {
            //     var d = json.decode(snapshot.data.toString());
            //     attend = d;
            //     return Text("");
            //   },
            //   future: DefaultAssetBundle.of(context)
            //       .loadString("assets/attendences.json"),
            // ),
            //  Padding(
            //    padding: const EdgeInsets.all(8.0),
            //    child: TextField(
            //      controller:textController ,
            //      decoration: InputDecoration(
            //        hintText: "Roll Number",
            //        border: OutlineInputBorder()
            //      ),
            //    ),
            //  ),
            //   FlatButton(
            //     onPressed: () {

            //     },
            //     color: const Color(0xFF5db075),
            //     child: Text("Search",style: TextStyle(color:Colors.white),),
            //   ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5db075),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      perc == null ? "0%" : perc,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ]),
    );
  }

  _findAttendence(var roll, var attend) {
    var index = 0;
    index = int.parse(roll.substring(8));
    var fin = attend[index - 1]['Perc'];
    debugPrint(fin);
    return fin;
  }
}
