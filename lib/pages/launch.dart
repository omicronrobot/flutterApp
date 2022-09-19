// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';

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
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacementNamed(widget.nextRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color(0xff152238),
      // ignore: prefer_const_constructors
      body: Center(
        child: const Text(
          'OMICRON',
          style: TextStyle(
              fontSize: 40, color: Colors.grey, fontFamily: "FredokaOne"),
        ),
      ),
    );
  }
}
