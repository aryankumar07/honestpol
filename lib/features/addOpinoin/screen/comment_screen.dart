import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/features/addOpinoin/service/addOpinionSerrvice.dart';
import 'package:honestpol/features/addOpinoin/widgets/options.dart';

class CommentScreen extends StatefulWidget {

  static const String routeName = '/poll/commnet-screen';

  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  Color _defaultColor = Colors.lime.shade300;

  final TextEditingController questionController = TextEditingController();

  final AddopinionService addopinionService = AddopinionService();

  File? picked_image;

  void pickimage()async{
    picked_image = await PickImages();
    if(picked_image!=null){
      setState(() {});
    }
  }


  void showbottomsheet(BuildContext context){
    Scaffold.of(context).showBottomSheet(
      sheetAnimationStyle: AnimationStyle(
        duration: Duration(seconds: 1),
        reverseDuration: Duration(seconds: 1),
      ),
      (BuildContext context){
        return Container(
          height: 150,
          width: double.infinity ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.remove)),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        _defaultColor = Colors.amber.shade800;
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.amber.shade800,
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _defaultColor = Colors.blue.shade300;
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue.shade300,
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _defaultColor = Colors.deepPurple.shade300;
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.deepPurple.shade300,
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _defaultColor = Colors.green.shade300;
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green.shade300,
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _defaultColor = Colors.cyan.shade200;
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.cyan.shade200,
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
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
            'Comment',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
            ),
          ),
          actions: [
            InkWell(
              onTap: (){
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
          child: InkWell(
            onTap: (){
              addopinionService.addCommentPoll(
                context: context, 
                question: questionController.text, 
                commenturl: picked_image!, 
                colordata: _defaultColor);
            },
            child: Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                color: Colors.white
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width/2-50,),
                  Text(
                    'Post',
                    style: GoogleFonts.kodeMono(
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      )
                    ),
                    )
                ],
              ),
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
                      textStyle: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
          
                  SizedBox(height: 10,),
          
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _defaultColor,
                    borderRadius: BorderRadius.all(Radius.circular(14))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Opacity(
                              opacity: 0.4,
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width/2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(14)),
                                  color: Colors.black
                                ),
                                child: IconButton(
                                  onPressed: (){}, 
                                  icon: Row(
                                    children: [
                                      Icon(Icons.do_disturb_outlined),
                                      SizedBox(width: 10,),
                                      Text('Comment Poll'),
                                    ],
                                  )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Builder(
                              builder: (context){
                                return InkWell(
                                  onTap: (){
                                    showbottomsheet(context);
                                  },
                                  child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: _defaultColor,
                                    child: Icon(
                                      CupertinoIcons.pencil_circle,
                                      color: Colors.white,
                                      size: 25,
                                      ),
                                  ),
                                                              ),
                                );
                              })
                          )
                        ],
                      ),
          
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          child: TextField(
                            controller: questionController,
                            maxLines: 3,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.lilitaOne(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              )
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Enter Your Question',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                if(picked_image!=null)...[
                  Container(
                    height: 200,
                    width: 300,
                    child: Image.file(
                      picked_image!,
                      fit: BoxFit.fill,),
                  )
                ],
                if(picked_image==null)...[
                    DottedBorder(
                    borderType: BorderType.RRect,
                    color: Colors.white,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: InkWell(
                        onTap: (){
                          pickimage();
                        },
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: Center(
                            child: Icon(
                                CupertinoIcons.camera_on_rectangle_fill
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]

              ],
            ),
          ),
        ),
      ),
    );
  }
}