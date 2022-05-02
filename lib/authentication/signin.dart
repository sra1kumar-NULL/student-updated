import 'package:app/authentication/signup.dart';
import 'package:app/ui/starthome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController rollNoController = TextEditingController();
TextEditingController passNoController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('roll', rollNoController.text);
    await prefs.setString('pass', passNoController.text);
    final String? roll = prefs.getString('roll');
    final String? pass = prefs.getString('pass');
    if (roll != null && pass != null) {
      loginCheck();
    }
  }

  void loginCheck() async {
    final prefs = await SharedPreferences.getInstance();
    final String? roll = prefs.getString('roll');
    if (roll != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StartScreen()));
    }
  }

  @override
  void initState() {
    loginCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: rollNoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Roll Number"),
            ),
          ),
          // SizedBox(
          //   height: 25,
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: passNoController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () => {
              login()
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => StartScreen()))
            },
            child: Text(
              "Login",
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "if don't have account",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()))
                    },
                    child: Text("Create Account",
                        style:
                            TextStyle(fontSize: 21, color: Colors.redAccent)),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
