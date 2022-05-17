import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/constants.dart';

class RadialBackgroundPainter extends CustomPainter {
  final double radius;
  final Color color;
  RadialBackgroundPainter({required this.radius, required this.color});
  Paint circlePaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width / 2;
    final y = size.height / 2;
    for (int a = 1; a <= 3; a++) {
      circlePaint.color = color.withOpacity((1 / a) - 0.2);
      canvas.drawCircle(Offset(x, y), radius + (spacing_10 * a), circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
