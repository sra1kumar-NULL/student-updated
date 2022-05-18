import 'package:app/ui/calender.dart';
import 'package:app/ui/grade.dart';
import 'package:app/ui/profile.dart';
import 'package:app/ui/timetable.dart';

import 'package:flutter/material.dart';

import 'attendence.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Student Corner", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF5db075),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: InkWell(
                //  splashColor: Colors.green,
                child: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              decoration:const  BoxDecoration(
                color:  Color(0xFF5db075),
              ),
            ),
            ListTile(
              title: const Text("Grade Cards"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const  GradeCalc()));
              },
            ),
            ListTile(
              title: const Text("Academic Calender"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Calender()));
              },
            ),
            ListTile(
              title: const Text("Time Table"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TimeTable()));
              },
            ),
            ListTile(
              title: const Text("Attendence"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Attendence()));
              },
            ),
            ListTile(
              title:const  Text("Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const GradeCalc()));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:const  BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const  [
                      Icon(Icons.note_alt_outlined),
                     SizedBox(
                        width: 26,
                      ),
                       Text("Grade Card")
                    ],
                  ),
                ),
              ),
             const  SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Attendence()));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:const  BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                       Icon(Icons.card_membership_outlined),
                     SizedBox(
                        width: 26,
                      ),
                       Text("Attendance")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TimeTable()));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:const [
                       Icon(Icons.table_chart_outlined),
                       SizedBox(
                        width: 30,
                      ),
                       Text("TimeTable")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Calender()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  width: 100,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:const [
                       Icon(Icons.calendar_today_outlined),
                       SizedBox(
                        width: 36,
                      ),
                       Text("Calendar")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                       Icon(Icons.person_outline_rounded),
                      SizedBox(
                        width: 48,
                      ),
                       Text("Profile")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
