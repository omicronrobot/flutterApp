// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:testapp/pages/control.dart';
import 'package:testapp/widgets/curved_painter.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
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
            Container(
              child: Column(
                children: [
                  Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Protocol',
                      style: TextStyle(
                        fontFamily: 'FredokaOne',
                        fontSize: 15,
                        color: Colors.orange[700],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'http/mqqt/ws',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Endpoint',
                      style: TextStyle(
                        fontFamily: 'FredokaOne',
                        fontSize: 15,
                        color: Colors.orange[700],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'http://omicron.rodneyosodo.com/api',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: width,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const JoypadPage();
                        }));
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: const EdgeInsets.all(15),
                        backgroundColor: Colors.orange[700],
                      ),
                      child: const Text(
                        'Setup',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
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
                  Container(
                    width: width,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(alignment: Alignment.centerLeft),
                      child: Text(
                        'Privacy',
                        style: TextStyle(
                          color: Colors.orange[700],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
