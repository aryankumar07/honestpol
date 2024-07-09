import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Custombottombutton extends StatelessWidget{
  final double outerRadius;
  final double innerRadius;
  final double iconsSize;
  final IconData icondata;
  final bool selected;

  const Custombottombutton({
    super.key, 
    required this.outerRadius, 
    required this.innerRadius, 
    required this.iconsSize, 
    required this.icondata,
    required this.selected
    });
  

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
                radius: outerRadius,
                backgroundColor: selected ? Colors.white : Colors.black87,
                child: CircleAvatar(
                  radius: innerRadius,
                  backgroundColor: selected ? Colors.white : Colors.black87,
                  child: Icon(
                    icondata,
                    size: iconsSize,
                    color: selected ? Colors.black : Colors.white,
                    ),
                ),
              );
  }
}