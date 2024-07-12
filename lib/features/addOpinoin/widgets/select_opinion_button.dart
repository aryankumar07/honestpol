import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectOpinionButton extends StatelessWidget{

  final String type;
  final IconData icondata;
  final Color color;

  SelectOpinionButton({
    super.key,
    required this.type,
    required this.icondata,
    required this.color
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: color
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
              icondata,
              size: 20,
              ),
            SizedBox(width: 20,),
            Text(
              type,
              style: GoogleFonts.kodeMono(
                textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
            ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 20,
              )
          ],
        ),
      ),
    );
  }
}