import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';
import 'package:honestpol/features/addOpinoin/screen/comment_screen.dart';
import 'package:honestpol/features/addOpinoin/screen/custome_post_screen.dart';
import 'package:honestpol/features/addOpinoin/screen/yes_no_opinion_screen.dart';
import 'package:honestpol/features/addOpinoin/widgets/select_opinion_button.dart';

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
            title: Text('Add Poll',
                style: GoogleFonts.kodeMono(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Generated Opinion',
                    style: GoogleFonts.kodeMono(
                        textStyle: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, YesNoOpinionScreen.routeName);
                  },
                  child: SelectOpinionButton(
                    type: "Yes/No",
                    icondata: CupertinoIcons.arrow_branch,
                    color: Colors.amber.shade800,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CommentScreen.routeName);
                  },
                  child: SelectOpinionButton(
                    type: "Comment Type",
                    icondata: Icons.comment_rounded,
                    color: Colors.lime.shade600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Custom Opinoin',
                    style: GoogleFonts.kodeMono(
                        textStyle: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CustomePostScreen.routeName);
                  },
                  child: SelectOpinionButton(
                    type: "Custom Type",
                    icondata: CupertinoIcons.capslock_fill,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
