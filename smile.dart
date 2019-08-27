import 'package:flutter/material.dart';

class Smile extends CustomPainter {
  Paint face;
  Paint eye;
  Path mouse;
  double xCenter, yCenter;
  double end, mid;
  double rate;
  Smile({this.rate});

  @override
  void paint(Canvas canvas, Size size) {
    init();

    xCenter = size.width / 2;
    yCenter = size.height / 2;

    // 얼굴 형
    canvas.drawCircle(Offset(xCenter, yCenter), xCenter, face);
    // 눈
    canvas.drawCircle(Offset(size.width / 4, size.height / 3), 10, eye);
    canvas.drawCircle(Offset(3 * size.width / 4, size.height / 3), 10, eye);

    var leftEnd = Offset(size.width / 4, size.height * end);
    var leftMid = Offset(2 * size.width / 6, size.height * mid);
    var rightMid = Offset(4 * size.width / 6, size.height * mid);
    var rightEnd = Offset(3 * size.width / 4, size.height * end);

    mouse.moveTo(leftEnd.dx, leftEnd.dy);
    mouse.cubicTo(leftMid.dx, leftMid.dy, rightMid.dx, rightMid.dy, rightEnd.dx,
        rightEnd.dy);

    canvas.drawPath(mouse, face);
  }

  void init() {
    face = Paint();
    mouse = Path();
    eye = Paint();
    face.color = Colors.black;
    face.strokeWidth = 3;
    face.style = PaintingStyle.stroke;
    eye.color = Colors.black;
    eye.style = PaintingStyle.fill;

    end = 6.0 / 8.0 - 2.0 / 10.0 * rate; // 양 끝
    mid = 4.0 / 8.0 + 3.0 / 10.0 * rate; // 가운데쪽 2개 점
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
