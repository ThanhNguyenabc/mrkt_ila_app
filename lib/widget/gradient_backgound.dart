import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key? key, this.gradient, this.child})
      : super(key: key);
  final Gradient? gradient;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: size.height / 2 + 100,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: gradient ??
                    LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.havelockBlue.withOpacity(0.3),
                          Colors.white.withOpacity(0.01)
                        ],
                        stops: const [
                          0.1,
                          0.9
                        ])),
          ),
        ),
        if (child != null) child!
      ],
    );
  }
}
