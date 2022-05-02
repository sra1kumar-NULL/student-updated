import 'package:app/authentication/signin.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController rollNoController = TextEditingController();
    TextEditingController passNoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
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
          // SizedBox(
          //   height: 5,
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: rollNoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Roll Number"),
            ),
          ),
          // SizedBox(
          //   height: 5,
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: passNoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () => {},
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
