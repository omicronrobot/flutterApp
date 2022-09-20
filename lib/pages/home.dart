import 'package:flutter/material.dart';
import 'package:testapp/pages/loading.dart';
import 'package:testapp/pages/setup.dart';
import 'package:testapp/widgets/orientation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  static List<Widget> pages = <Widget>[
    const OrientationPage(),
    const Loading(),
    const SetupPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(pageIndex),
      ),
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            label: 'info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            label: 'back',
          ),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: onItemTapped,
      ),
    );
  }
}
