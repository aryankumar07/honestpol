import 'package:flutter/material.dart';

class Customcircleavatar extends StatelessWidget{

  final double outerRadius;
  final double innerRadius;
  final double iconsSize;
  final IconData icondata;

  Customcircleavatar({
    super.key,
    required this.outerRadius,
    required this.innerRadius,
    required this.iconsSize,
    required this.icondata
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
                radius: outerRadius,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: innerRadius,
                  backgroundColor: Colors.black,
                  child: Icon(
                    icondata,
                    size: iconsSize,
                    ),
                ),
              );
  }
}