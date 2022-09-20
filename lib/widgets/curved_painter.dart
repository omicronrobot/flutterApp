import 'package:flutter/material.dart';

class CurvedPaint extends StatelessWidget {
  const CurvedPaint({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
            child: CustomPaint(
          size: Size(width, height*0.35),
          painter: CurvedPainter(),
        )),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // var color = Colors.orange[400];
    // var strokeWidth = 15;
    var path = Path();

    path.moveTo(0, size.height * -0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * -0.7,
        size.width * 0.5, size.height * -0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * -0.9,
        size.width * 1.0, size.height * -0.8);
    path.lineTo(size.width, size.height * -1.0);
    path.lineTo(0, size.height * -1.0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
