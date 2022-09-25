// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';

class JoypadPage extends StatefulWidget {
  const JoypadPage({super.key});

  @override
  State<JoypadPage> createState() => _JoypadPageState();
}

class _JoypadPageState extends State<JoypadPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff152238),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Center(
            child: Container(
              width: width,
              height: height,
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.orange[600],
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.all(15),
                              fixedSize: const Size(120, 40),
                              elevation: 15,
                              shadowColor: Colors.orange[600],
                            ),
                            icon: const Icon(Icons.start_rounded),
                            label: const Text('Start'),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.orange[600],
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.all(15),
                              fixedSize: const Size(120, 40),
                              elevation: 15,
                              shadowColor: Colors.orange[600],
                            ),
                            icon: const Icon(Icons.stop_circle_outlined),
                            label: const Text('Stop'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange[600],
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(15),
                      fixedSize: const Size(120, 40),
                      elevation: 15,
                      shadowColor: Colors.orange[600],
                    ),
                    icon: const Icon(Icons.replay_10_rounded),
                    label: const Text('Replay'),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    child: JoystickView(
                      backgroundColor: Colors.orange[600],
                      iconsColor: Colors.black,
                      innerCircleColor: Colors.black,
                      showArrows: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 100,),
              IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    Navigator.pop(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
