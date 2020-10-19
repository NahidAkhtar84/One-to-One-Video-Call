import 'package:flutter/material.dart';

class SignInOptionsClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.5, 0);
    path.quadraticBezierTo(0, 0, 0, size.height * 0.5);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SignInOptionsBoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.5, 0);
    path.quadraticBezierTo(0, 0, 0, size.height * 0.5);

    canvas.drawShadow(path, Colors.blue, 5.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
