import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/models/app_banner.dart';
import 'package:testapp/pages/home.dart';
import 'package:testapp/widgets/slide_dots.dart';
import '../widgets/slider.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int _currentPage = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff152238),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemBuilder: (context, index) => Sliders(
                        index: index,
                      ),
                      itemCount: slideList.length,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 35.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const Home();
                      }));
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.blue[400],
                    ),
                    child: const Text('Get Started'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
