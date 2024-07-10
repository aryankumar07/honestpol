import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60,
      lineWidth: 10,
      percent: 0.5,
      backgroundColor: Colors.deepPurple.shade100,
      progressColor: Colors.deepPurple,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        '10/20',
        style: GoogleFonts.kodeMono(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}