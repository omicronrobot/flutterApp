// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:testapp/pages/joypad.dart';
import 'package:testapp/pages/loading.dart';

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
              width: width,
              height: height * 0.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/wavy_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to Omicron',
              style: TextStyle(
                fontFamily: 'FredokaOne',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
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
                    width: width,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'http/mqqt',
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
                    margin: const EdgeInsets.symmetric(horizontal: 15),
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
                    margin: const EdgeInsets.symmetric(horizontal: 15),
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
                    margin: const EdgeInsets.symmetric(horizontal: 15),
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
                    margin: const EdgeInsets.fromLTRB(15, 0, 280, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const LoadingPage();
                        }));
                      },
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
                    margin: const EdgeInsets.fromLTRB(15, 0, 280, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const LoadingPage();
                        }));
                      },
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
