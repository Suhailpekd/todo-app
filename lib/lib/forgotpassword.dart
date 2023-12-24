import 'package:flutter/material.dart';
import 'package:todonewappforinfnite/lib/createaaccount.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: SizedBox(
              height: 65,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 46),
                    child: Icon(Icons.arrow_back),
                  ),
                  Center(
                    child: Text(
                      "Forgot Password",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 55,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 11),
                      ),
                      hintText: "Email"),
                ),
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset in x and y directions
                    ),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5)),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38, top: 20),
            child: Text(
                "Enter The Email Address You used to create your Account,and we will email you acode rest your password"),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 37.0,
                right: 37.0,
              ),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 234, 227, 236),
                        blurRadius: 8,
                        spreadRadius: 5,
                      )
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(child: Text("Continue")),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text("Don't have an account ?"),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Reg(),
                      )),
                  child: Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
