import 'package:flutter/material.dart';
import 'package:machinetest1/registrationform2.dart';

class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final formkey = GlobalKey<FormState>();
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  bool check = false;
  bool check1 = false;
  String gvalue = "gender";
  bool? isgender = false;
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: formkey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "please enter your name";
                    }
                  },
                  controller: a,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "please enter your age";
                    }
                  },
                  controller: b,
                  decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "please enter your address";
                    }
                  },
                  controller: c,
                  decoration: InputDecoration(
                      hintText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: "male",
                      groupValue: gvalue,
                      onChanged: (v) {
                        setState(() {
                          gvalue = v!;
                          isgender = true;
                        });
                      }),
                  Text(
                    "Male",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Radio(
                      value: "female",
                      groupValue: gvalue,
                      onChanged: (value) {
                        setState(() {
                          gvalue = value!;
                          isgender = true;
                        });
                      }),
                  Text(
                    "Female",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Languages",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: check,
                      onChanged: (v) {
                        setState(() {
                          check = true;
                          ischecked = true;
                        });
                      }),
                  Text(
                    "English",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Checkbox(
                      value: check1,
                      onChanged: (v) {
                        setState(() {
                          check1 = true;
                          ischecked = true;
                        });
                      }),
                  Text(
                    "Hindi",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    final g = formkey.currentState!.validate();
                    if (g == true && ischecked == true && isgender == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Successfully Added")));
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Form2(
                            name: a.text,
                            age: b.text,
                            address: c.text,
                            gender: gvalue,
                            language: ischecked);
                      }));
                    }
                  },
                  child: Text("Submit"))
            ]),
          ),
        ));
  }
}
