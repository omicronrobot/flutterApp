import 'package:flutter/material.dart';
import 'package:testapp/widgets/landscape.dart';
import 'package:testapp/widgets/portrait.dart';

class OrientationPage extends StatefulWidget {
  const OrientationPage({super.key});

  @override
  State<OrientationPage> createState() => _OrientationPageState();
}

class _OrientationPageState extends State<OrientationPage> {

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Center(
        child: deviceOrientation == Orientation.portrait
            ? const PortraitView()
            : const LandscapeView(),
      ),
    );
  }
}
