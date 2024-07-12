import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButtonPoll extends StatelessWidget {
  final double innerradius;
  final double outerradius;
  final double iconsize;
  final IconData icondata;
  final VoidCallback onPressed;
  final Color color;

  CircleButtonPoll({
    super.key,
    required this.innerradius,
    required this.outerradius,
    required this.icondata,
    required this.iconsize,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: outerradius,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: innerradius,
          backgroundColor: color,
          child: Icon(
            icondata,
            size: iconsize,
          ),
        ),
      ),
    );
  }
}
