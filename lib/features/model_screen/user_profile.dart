import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/features/profile/widgets/circle_indicator.dart';
import 'package:honestpol/features/profile/widgets/profiletextbox.dart';
import 'package:honestpol/features/profile/widgets/timeline_widget.dart';
import 'package:honestpol/models/user.dart';

class UserProfile extends StatefulWidget {

  static const String routeName = '/home/user-profile';

  final User user;

  const UserProfile({
    super.key,
    required this.user,
    });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios)),
        title: Text(
          'User Profile',
          style: GoogleFonts.kodeMono(
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/3+50,
                        child: Card(
                          elevation: 1,
                          color: Colors.blueGrey.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 90,),
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width/2-90,),
                                  Text(
                                    widget.user.name,
                                    style: GoogleFonts.kodeMono(
                                      textStyle: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                      )
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'cid : ${widget.user.cid}',
                                style: GoogleFonts.kodeMono(
                                  textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white
                                  )
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width/4+20,
                      top: 30,
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(14)),
                              child:  widget.user.profilepic.isEmpty?
                              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSIHAgAt1qr3dZoRVKjpw4p2qddppl7TRnog&s')
                              :
                              Image.network(widget.user.profilepic,fit: BoxFit.cover,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 20,
                      child: Container(
                        height: MediaQuery.of(context).size.width/4,
                        width: MediaQuery.of(context).size.width/4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Colors.grey.shade900
                        ),
                        child: Profiletextbox(wins: 0, text: 'Wins',)
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 130,
                      child: Container(
                        height: MediaQuery.of(context).size.width/4,
                        width: MediaQuery.of(context).size.width/4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Colors.grey.shade900
                        ),
                        child: Profiletextbox(wins: 0, text: 'Loose')
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 240,
                      child: Container(
                        height: MediaQuery.of(context).size.width/4,
                        width: MediaQuery.of(context).size.width/4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Colors.grey.shade900
                        ),
                        child: Profiletextbox(wins: widget.user.votes.length, text: 'Participated'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 550,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.cyan.shade900
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        CircleIndicator(),
                        SizedBox(width: 30,),
                        Column(
                          children: [
                            Text(
                              'Current Status',
                              style: GoogleFonts.kodeMono(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.lightGreen.shade100
                                )
                              ),
                            ),
                            Text(
                              '${{ widget.user.status }}',
                              style: GoogleFonts.kodeMono(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.redAccent
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    TimelineWidget(status: widget.user.status,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      )
    );
  }
}