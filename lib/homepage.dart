import 'package:flutter/material.dart';
import 'package:machinetest1/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            SharedPreferences sharedpref =
                await SharedPreferences.getInstance();
            sharedpref.clear();
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return Loginpage1();
            }), (route) => false);
          },
          child: Container(
            height: 40,
            width: 100,
            child: Center(
              child: Text(
                "Sign out",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.purple.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
