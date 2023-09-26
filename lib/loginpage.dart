import 'package:flutter/material.dart';
import 'package:machinetest1/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage1 extends StatefulWidget {
  const Loginpage1({Key? key}) : super(key: key);

  @override
  State<Loginpage1> createState() => _Loginpage1State();
}

class _Loginpage1State extends State<Loginpage1> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController namecontroller1 = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final sharedpref = SharedPreferences.getInstance().then((value) {
      var textvalue = value.getBool("emailandpassword");
      if (textvalue == true) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Homepage1();
        }));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formkey,
      child: Column(
        children: [
          Container(
            height: 200,
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.purple.shade700,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.purple.shade200,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.purple.shade600,
              cursorHeight: 23,
              validator: (v) {
                if (v!.isEmpty) {
                  return "please enter your email address";
                }
              },
              controller: namecontroller,
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              cursorHeight: 23,
              cursorColor: Colors.purple.shade600,
              obscureText: true,
              validator: (v) {
                if (v!.isEmpty) {
                  return "please enter your password";
                }
              },
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
              controller: namecontroller1,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              final g = formkey.currentState!.validate();
              SharedPreferences sharedpref =
                  await SharedPreferences.getInstance();
              await sharedpref.setBool("emailandpassword", true);
              sharedpref.getBool("emailandpassword");
              if (g == true) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Homepage1();
                }));
              }
            },
            child: Container(
              height: 40,
              width: 100,
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.purple.shade600,
                  borderRadius: BorderRadius.circular(15)),
            ),
          )
        ],
      ),
    ));
  }
}
