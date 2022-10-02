// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:omicronapp/widgets/terms_of_use.dart';

import '../widgets/curved_painter.dart';
import '../widgets/protocol_dropdown.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              child: Center(
                  child: CustomPaint(
                size: Size(width, height * 0.4),
                painter: CurvedPainter(),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: Text(
              'Welcome to Omicron',
              style: TextStyle(
                fontFamily: 'FredokaOne',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange[700],
              ),
              textAlign: TextAlign.center,
            )),
            const SizedBox(
              height: 20,
            ),
            const SetupForm(),
            Container(
              width: width,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextButton(
                onPressed: () {},
                style: const ButtonStyle(alignment: Alignment.centerLeft),
                child: Text(
                  'Guide?',
                  style: TextStyle(
                    color: Colors.orange[700],
                  ),
                ),
              ),
            ),
            const TermsOfUse(),
          ],
        ),
      ),
    );
  }
}
