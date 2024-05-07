import 'package:flutter/material.dart';
import 'dart:math' as math;

class PentagonContainer extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const PentagonContainer({
    super.key,
    this.size = 100.0,
    this.color = Colors.blue, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: PentagonPainter(color),
      child: Container(
        width: size,
        height: size,
        child: Text(text),
      ),
    );
  }
}

class PentagonPainter extends CustomPainter {
  final Color color;

  PentagonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double radius = size.width / 2;

    const double angle = math.pi * 2 / 5; // Angle between each corner

    Path path = Path();

    path.moveTo(centerX + radius * math.cos(0), centerY + radius * math.sin(0));

    for (int i = 1; i <= 5; i++) {
      path.lineTo(
        centerX + radius * math.cos(angle * i),
        centerY + radius * math.sin(angle * i),
      );
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


