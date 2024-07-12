import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';
import 'package:honestpol/features/addOpinoin/widgets/circle_button_poll.dart';
import 'package:honestpol/features/addOpinoin/widgets/option_type.dart';

class CustomePostScreen extends StatefulWidget {
  static const String routeName = '/custom-post-screen';

  const CustomePostScreen({super.key});

  @override
  State<CustomePostScreen> createState() => _CustomePostScreenState();
}

class _CustomePostScreenState extends State<CustomePostScreen> {
  Color _defaultColor = Colors.amber.shade800;

  void showbottomsheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
        sheetAnimationStyle: AnimationStyle(
          duration: Duration(seconds: 1),
          reverseDuration: Duration(seconds: 1),
        ), (BuildContext context) {
      return Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.remove)),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _defaultColor = Colors.amber.shade800;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber.shade800,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _defaultColor = Colors.blue.shade300;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue.shade300,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _defaultColor = Colors.deepPurple.shade300;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.deepPurple.shade300,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _defaultColor = Colors.green.shade300;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green.shade300,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _defaultColor = Colors.cyan.shade200;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.cyan.shade200,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _defaultColor = Colors.lime.shade300;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.lime.shade300,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Custom Poll',
            style: GoogleFonts.kodeMono(
                textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Customcircleavatar(
                  outerRadius: 40,
                  innerRadius: 27,
                  iconsSize: 28,
                  icondata: CupertinoIcons.xmark),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 50,
                ),
                Text(
                  'Post',
                  style: GoogleFonts.kodeMono(
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEW POLL',
                  style: GoogleFonts.kodeMono(
                      textStyle:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: _defaultColor,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10),
                              child: OptionType(
                                icondata:
                                    CupertinoIcons.square_line_vertical_square,
                                text: 'Selection Poll',
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 10),
                            child: OptionType(
                                icondata: Icons.comment, text: 'Comment Poll'),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          child: TextField(
                            maxLines: 3,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.lilitaOne(
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'Enter Your Question'),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleButtonPoll(
                                innerradius: 26,
                                outerradius: 30,
                                icondata: CupertinoIcons.photo_camera,
                                iconsize: 22,
                                onPressed: () {},
                                color: _defaultColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleButtonPoll(
                                innerradius: 26,
                                outerradius: 30,
                                icondata: CupertinoIcons.video_camera,
                                iconsize: 22,
                                onPressed: () {},
                                color: _defaultColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Builder(builder: (context) {
                              return CircleButtonPoll(
                                  innerradius: 26,
                                  outerradius: 30,
                                  icondata: CupertinoIcons.pencil,
                                  iconsize: 22,
                                  onPressed: () {
                                    showbottomsheet(context);
                                  },
                                  color: _defaultColor);
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
