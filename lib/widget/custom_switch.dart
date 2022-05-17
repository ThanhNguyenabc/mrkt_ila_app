import 'package:flutter/cupertino.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch(
      {Key? key,
      required this.onChangeValue,
      this.defaultValue = false,
      this.position = const Offset(50, 0)})
      : super(key: key);
  final Function(bool) onChangeValue;
  final Offset position;
  final bool defaultValue;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isTurnOn = false;

  @override
  void initState() {
    isTurnOn = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.85,
      origin: widget.position,
      child: CupertinoSwitch(
          value: isTurnOn,
          onChanged: (value) {
            setState(() {
              isTurnOn = value;
            });
            widget.onChangeValue.call(value);
          }),
    );
  }
}
