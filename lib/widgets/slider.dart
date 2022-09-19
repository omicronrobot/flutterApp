import 'package:flutter/material.dart';
import 'package:testapp/models/app_banner.dart';

class Sliders extends StatelessWidget {
  final int index;

  const Sliders({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.maxFinite,
          height: 200,
          decoration: BoxDecoration(
            // shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(slideList[index].thumbnail),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Text(
          slideList[index].title,
          textAlign: TextAlign.center,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 30,
            color: Colors.grey,
            fontFamily: 'FredokaOne',
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
            fontFamily: 'FredokaOne',
          ),
        ),
      ],
    );
  }
}
