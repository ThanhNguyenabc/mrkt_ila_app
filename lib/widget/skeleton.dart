import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  const Skeleton(
      {Key? key,
      this.width = 200,
      this.height = 20,
      this.boxShape = BoxShape.rectangle})
      : super(key: key);
  final double width;
  final double height;
  final BoxShape boxShape;
  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> gradientPosition;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    gradientPosition =
        Tween(begin: -3.0, end: 10.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          shape: widget.boxShape,
          gradient: LinearGradient(
              begin: Alignment(gradientPosition.value, 0),
              end: const Alignment(-1, 0),
              colors: [
                Colors.black.withOpacity(0.03),
                Colors.black.withOpacity(0.05),
                Colors.black.withOpacity(0.03),
              ])),
    );
  }
}
