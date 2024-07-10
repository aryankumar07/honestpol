import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Profiletextbox extends StatelessWidget{
  final int wins;
  final String text;

  Profiletextbox({
    super.key,
    required this.wins,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text(
          '$wins',
          style: GoogleFonts.kodeMono(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
              )),
              ),
        Text(
          '$text',
          style: GoogleFonts.kodeMono(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis
              )),
              )
      ],);
  }
}