// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Launch extends StatefulWidget {
  final String nextRoute; //variable to store the route
  const Launch({required this.nextRoute});

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  void initState() {
    //state initialization
    super.initState();
    //create a timer to switch from Launch to Home after 3 seconds
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed(widget.nextRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // backgroundColor: const Color.fromARGB(230, 203, 109, 21),
      backgroundColor: Colors.orange[700],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 100.0,
              right: 10.0,
              bottom: 10.0,
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/iconfinder_robot_9025976.svg",
                width: 300,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Robots Assemble",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontFamily: "FredokaOne",
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
