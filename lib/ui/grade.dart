import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GradeCalc extends StatefulWidget {
  const GradeCalc({Key? key}) : super(key: key);

  @override
  _GradeCalcState createState() => _GradeCalcState();
}

class _GradeCalcState extends State<GradeCalc> {
  final rollcontroller = TextEditingController();
  var sem1, sem2, sem3, sem4, sem5, sem6, sem7;
  var gpa1, gpa2, gpa3, gpa4, gpa5, gpa6, gpa7;

  Future getSem1() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/cse/sem1.json');
    sem1 = json.decode(data);

    setState(() {
      gpa1 = _calculateGrade(rollcontroller.text, sem1);
    });
  }

  Future getSem2() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/cse/sem2.json');
    sem2 = json.decode(data);

    setState(() {
      gpa2 = _calculateGrade(rollcontroller.text, sem2);
    });
  }

  Future getSem3() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/cse/sem3.json');
    sem3 = json.decode(data);

    setState(() {
      gpa3 = _calculateGrade(rollcontroller.text, sem3);
    });
  }

  Future getSem4() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/cse/sem4.json');
    sem4 = json.decode(data);

    setState(() {
      gpa4 = _calculateGrade(rollcontroller.text, sem4);
    });
  }

  Future getSem5() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/cse/sem5.json');
    sem5 = json.decode(data);

    setState(() {
      gpa5 = _calculateGrade(rollcontroller.text, sem5);
    });
  }

  Future getSem6() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/cse/sem6.json');
    sem6 = json.decode(data);

    setState(() {
      gpa6 = _calculateGrade(rollcontroller.text, sem6);
    });
  }

  Future getSem7() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/cse/sem7.json');
    sem7 = json.decode(data);

    setState(() {
      gpa7 = _calculateGrade(rollcontroller.text, sem7);
    });
  }

  void temp() async {
    final prefs = await SharedPreferences.getInstance();
    final String? roll = prefs.getString('roll');
    rollcontroller.text = roll.toString();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await getSem1();
      await getSem2();
      await getSem3();
      await getSem4();
      await getSem5();
      await getSem6();
      await getSem7();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    temp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5db075),
        title: Text(
          "Grade Card",
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                FutureBuilder(
                  builder: (context, snapshot) {
                    var showData = json.decode(snapshot.data.toString());
                    sem1 = showData;
                    return const Text("");
                  },
                  future:
                      //getSem1(),
                      DefaultAssetBundle.of(context)
                          .loadString("assets/cse/sem1.json"),
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    var showData = json.decode(snapshot.data.toString());
                    sem2 = showData;
                    return const Text("");
                  },
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/cse/sem2.json"),
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    var showData = json.decode(snapshot.data.toString());
                    sem3 = showData;
                    return const Text("");
                  },
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/cse/sem3.json"),
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    var showData = json.decode(snapshot.data.toString());
                    sem4 = showData;
                    return const Text("");
                  },
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/cse/sem4.json"),
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    var showData = json.decode(snapshot.data.toString());
                    sem5 = showData;
                    return const Text("");
                  },
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/cse/sem5.json"),
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    var showData = json.decode(snapshot.data.toString());
                    sem6 = showData;
                    return const Text("");
                  },
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/cse/sem6.json"),
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    var showData = json.decode(snapshot.data.toString());
                    sem7 = showData;
                    return const Text("");
                  },
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/cse/sem7.json"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: Card(
                  elevation: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Year I Semester 1  :  "),
                      SizedBox(
                        width: 120,
                      ),
                      Text(gpa1 == null ? "" : gpa1.toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: Card(
                  elevation: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Year I Semester 2  :  "),
                      SizedBox(
                        width: 120,
                      ),
                      Text(gpa2 == null ? "" : gpa2.toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: Card(
                  elevation: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Year II Semester 1  : "),
                      SizedBox(
                        width: 120,
                      ),
                      Text(gpa3 == null ? "" : gpa3.toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: Card(
                  elevation: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Year II Semester 2  : "),
                      SizedBox(
                        width: 120,
                      ),
                      Text(gpa4 == null ? "" : gpa4.toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: Card(
                  elevation: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Year III Semester 1  :"),
                      SizedBox(
                        width: 120,
                      ),
                      Text(gpa5 == null ? "" : gpa5.toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: Card(
                  elevation: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Year III Semester 2  :"),
                      SizedBox(
                        width: 120,
                      ),
                      Text(gpa6 == null ? "" : gpa6.toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: Card(
                  elevation: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Year IV Semester 1  :"),
                      SizedBox(
                        width: 120,
                      ),
                      Text(gpa7 == null ? "" : gpa7.toStringAsFixed(2)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  _calculateGrade(var check, var datalist) {
    var index = 0;
    var numer = 0;
    var denom = 0;
    var showData = datalist;
    var subs = 0;
    var i = showData.length - 1;
    var subfin = showData[i]['Htno'];
    while (showData[i]['Htno'] == subfin) {
      i--;
      subs++;
    }

    var c = 0;
    if (check.substring(0, 4) == "1803") {
      int x = int.parse(check.substring(8));
      index = index + (x - 1) * subs;
      while (showData[index]['Htno'] != check) {
        index += 1;
      }
      if (index >= showData.length - 1) {
        index = showData.length - 1;
      }
    }
    if (check.substring(0, 4) == "1903") {
      if (showData[showData.length - 1]['Htno'].substring(0, 4) == "1903") {
        final val =
            int.parse(showData[showData.length - 1]['Htno'].substring(8));

        index = showData.length - val * subs;

        int x = int.parse(check.substring(8));
        index = index + (x - 1) * subs;
        debugPrint(index.toString());
        while (showData[index]['Htno'] != check) {
          index++;
        }
        if (index >= showData.length - 1) {
          index = showData.length - 1;
        }
      } else {
        c = 1;
      }
    }
    if (c == 1) {
      return null;
    } else {
      while (showData[index]['Htno'] == check) {
        if (showData[index]['Grade'] == 'O') {
          numer += 10 * int.parse(showData[index]['Credits']);
          denom += int.parse(showData[index]['Credits']);
        }
        if (showData[index]['Grade'] == 'S') {
          numer += 9 * int.parse(showData[index]['Credits']);
          denom += int.parse(showData[index]['Credits']);
        }
        if (showData[index]['Grade'] == 'A') {
          numer += 8 * int.parse(showData[index]['Credits']);
          denom += int.parse(showData[index]['Credits']);
        }
        if (showData[index]['Grade'] == 'B') {
          numer += 7 * int.parse(showData[index]['Credits']);
          denom += int.parse(showData[index]['Credits']);
        }
        if (showData[index]['Grade'] == 'C') {
          numer += 6 * int.parse(showData[index]['Credits']);
          denom += int.parse(showData[index]['Credits']);
        }
        if (showData[index]['Grade'] == 'D') {
          numer += 5 * int.parse(showData[index]['Credits']);
          denom += int.parse(showData[index]['Credits']);
        }
        if (showData[index]['Grade'] == 'F') {
          numer += 0;
          denom += int.parse(showData[index]['Credits']);
        }
        if (index >= showData.length - 1) {
          index = showData.length - 1;
          break;
        }
        index++;
      }
    }

    final result = numer / denom;

    return result;
  }
}
