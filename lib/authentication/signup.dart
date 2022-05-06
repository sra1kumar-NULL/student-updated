import 'package:app/authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController passNoController = TextEditingController();
  void signUp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('roll', rollNoController.text);
    await prefs.setString('name', nameController.text);
    await prefs.setString('pass', passNoController.text);
    // final String? roll = prefs.getString('roll');
    // print(roll);

    // rollNoController.text = roll.toString();
  }

  void removeDet() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('roll');
    await prefs.remove('name');
    await prefs.remove('pass');
  }

  @override
  void initState() {
    // TODO: implement initState
    removeDet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: rollNoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Roll Number"),
            ),
          ),
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
            onPressed: () {
              if (rollNoController.text.substring(0, 4) == "1803") {
                int x = int.parse(rollNoController.text.substring(8));
                if (x <= 553) {
                  signUp();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text("Invalid Roll Number"),
                    duration: const Duration(seconds: 3),
                  ));
                }
              }
              if (rollNoController.text.substring(0, 4) == "1903") {
                int x = int.parse(rollNoController.text.substring(8));
                if (x <= 512) {
                  signUp();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text("Invalid Roll Number"),
                    duration: const Duration(seconds: 3),
                  ));
                }
              }
            },
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("if already an user ",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()))
                        },
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 24, color: Colors.redAccent),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

    
    // if (check.substring(0, 4) == "1903") {
    //   if (showData[showData.length - 1]['Htno'].substring(0, 4) == "1903") {
    //     final val =
    //         int.parse(showData[showData.length - 1]['Htno'].substring(8));

    //     index = showData.length - val * subs;

    //     int x = int.parse(check.substring(8));
    //     index = index + (x - 1) * subs;
    //     debugPrint(index.toString());
    //     while (showData[index]['Htno'] != check) {
    //       index++;
    //     }
    //     if (index >= showData.length - 1) {
    //       index = showData.length - 1;
    //     }
    //   } else {
    //     c = 1;
    //   }
    // }