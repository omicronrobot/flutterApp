import 'package:flutter/material.dart';

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color.fromARGB(230, 203, 109, 21);
    paint.style = PaintingStyle.fill;
    var path = Path();

    path.moveTo(0, size.height * 0.552);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.8334,
        size.width * 0.5, size.height * 0.552);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.2774,
        size.width * 1.0, size.height * 0.552);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }  
}
