import 'package:flutter/material.dart';
import 'package:testapp/widgets/landscape.dart';
import 'package:testapp/widgets/portrait.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    // ignore: prefer_const_constructors, avoid_unnecessary_containers
    return Scaffold(
      backgroundColor: const Color(0xff152238),
      body: deviceOrientation == Orientation.portrait
          ? const PortraitView()
          : const LandscapeView(),
    );
  }
}
