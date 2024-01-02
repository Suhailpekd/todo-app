import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:todonewappforinfnite/lib/screens/screens1login.dart';

class Splash_ extends StatefulWidget {
  const Splash_({super.key});

  @override
  State<Splash_> createState() => _Splash_State();
}

class _Splash_State extends State<Splash_> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Loginpage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 7, 7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  "Mimo",
                  style: GoogleFonts.bagelFatOne(
                    fontSize: 64,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 60, bottom: 30),
                child: Text(
                  "Todo",
                  style: GoogleFonts.bagelFatOne(
                      fontSize: 34, color: Color.fromARGB(255, 246, 246, 247)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
