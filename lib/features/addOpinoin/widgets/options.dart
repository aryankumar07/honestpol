import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsButton extends StatelessWidget{

  final String text;
  final IconData iconData;


  OptionsButton({
    super.key,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: Colors.black
      ),
      child: Row(
        children: [
          SizedBox(width: 30,),
          Icon(iconData,size: 22,),
          SizedBox(width: 10,),
          Text(
            text,
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal
              )
            ),
          )
        ],
      ),
    );
  } 
}