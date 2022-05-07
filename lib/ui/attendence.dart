import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/Notifications/Notify.dart';

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
    Notify();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5db075),
        title: Text("Attendence", style: TextStyle(color: Colors.white)),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {
                sendNotification()
              },
              child: Text("Refresh"),
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
