import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text(
            'honestpoll',
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
                icondata: Icons.notifications_none_rounded)
            ],
        ),
      ),
    );
  }
}