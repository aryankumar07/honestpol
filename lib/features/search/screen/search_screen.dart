import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Search',
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
          child: Text('search'),
        ),
      ),
    );
  }
}