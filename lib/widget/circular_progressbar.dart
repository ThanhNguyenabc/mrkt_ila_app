import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'dart:math' as math;

import 'package:mrkt_app/utils/constants.dart';

class CircularProgressBar extends StatefulWidget {
  CircularProgressBar(
      {Key? key, this.radius = 35, this.percentage = 60, this.child})
      : super(key: key) {
    assert(percentage <= 100);
  }
  final double radius;
  final int percentage;
  final Widget? child;
  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: getAngleByPercentage(widget.percentage))
        .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return CustomPaint(
            painter: CircularProgressBarPainter(
                radius: widget.radius, sweepAngle: animation.value),
            child: child,
          );
        },
        child: Container(
            // color: Colors.orange,
            padding: const EdgeInsets.all(spacing_10),
            width: widget.radius * 2,
            height: widget.radius * 2,
            child: widget.child));
  }

  double getAngleByPercentage(int percentage) =>
      (2 * math.pi * percentage) / 100;
}

class CircularProgressBarPainter extends CustomPainter {
  final double radius;
  final double sweepAngle;
  final double strokeWidth;

  Paint bgCirclePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = AppColors.anakiwa.withOpacity(0.3);

  Paint progressCirclePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  CircularProgressBarPainter(
      {required this.radius, required this.sweepAngle, this.strokeWidth = 12}) {
    bgCirclePaint.strokeWidth = strokeWidth;
    progressCirclePaint.strokeWidth = strokeWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final offset = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: offset, radius: radius);

    progressCirclePaint.shader = const LinearGradient(
      colors: [
        AppColors.portage,
        AppColors.dogerblue,
      ],
      stops: [0.05, 1],
    ).createShader(rect);

    canvas.drawCircle(offset, radius, bgCirclePaint);
    canvas.drawArc(rect, -math.pi / 2, sweepAngle, false, progressCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CircularProgressBarPainter oldDelegate) {
    return oldDelegate.radius != radius || oldDelegate.sweepAngle != sweepAngle;
  }
}
