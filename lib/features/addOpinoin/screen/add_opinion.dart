import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';

class AddopinionScreen extends StatefulWidget {
  const AddopinionScreen({super.key});

  @override
  State<AddopinionScreen> createState() => _AddopinionScreenState();
}

class _AddopinionScreenState extends State<AddopinionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Poll',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            )
            ),
            actions: [
              Customcircleavatar(
                outerRadius: 40, 
                innerRadius: 27, 
                iconsSize: 28, 
                icondata: CupertinoIcons.xmark)
            ],
        ),
        body: Center(
          child: Text('add opinion'),
        ),
      ),
    );
  }
}