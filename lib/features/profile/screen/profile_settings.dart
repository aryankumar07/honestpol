import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/custom_tfields.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/features/profile/service/profile_service.dart';
import 'package:honestpol/features/profile/widgets/circle_indicator.dart';
import 'package:honestpol/features/profile/widgets/profiletextbox.dart';
import 'package:honestpol/features/profile/widgets/timeline_widget.dart';
import 'package:honestpol/providers/userprovider.dart';
import 'package:provider/provider.dart';

class ProfileSettings extends StatefulWidget {

  static const String routeName = '/user/profile-settings';

  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  final ProfileService profileService = ProfileService();
  
  final TextEditingController nameEditingController = TextEditingController();

  var selected = false;
  File? picked_image;

  void pickProfileImages()async{
    picked_image = await PickImages();
    // print(picked_image);
    if(picked_image!.path!=''){
      setState(() {
        selected=true;  
      });
    }
  }

  void saveProfileImagesChanges(File profilepic,String cid){
    profileService.saveProfileImagesChanges(
      context: context, 
      profilepic: profilepic, 
      cid: cid);
  }

  void saveProfileNameChanges(String newname){
    profileService.saveProfileNameChanges(
      context: context, 
      newname: newname);
  }

  void showbottommodelsheet(BuildContext context){
    Scaffold.of(context).showBottomSheet(
      sheetAnimationStyle: AnimationStyle(
        duration: Duration(seconds: 1),
        reverseDuration: Duration(seconds: 1),
        ),
      (BuildContext context){
        return Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.remove)),
                SizedBox(height: 30,),
                CustomTextfield(
                  controller: nameEditingController, 
                  hintext: 'Enter a New Name', 
                  icondata: CupertinoIcons.number_square),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width/2,
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.xmark),
                        Text('Discard')
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    if(nameEditingController.text.isNotEmpty){
                      saveProfileNameChanges(nameEditingController.text);
                      Navigator.pop(context);
                      nameEditingController.text='';
                    }else{
                      ShowSnackbar(context, 'Enter a name or discard');
                    }
                  },
                  child: SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width/2,
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.checkmark_alt_circle),
                        Text('Change Name')
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      }
    );
  }





  @override
  Widget build(BuildContext context) {
  final userprovider = Provider.of<Userprovider>(context,listen: true).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customize Profile',
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
                                    userprovider.name,
                                    style: GoogleFonts.kodeMono(
                                      textStyle: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                      )
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      return InkWell(
                                        onTap: (){
                                          showbottommodelsheet(context);
                                        },
                                        child: Icon(Icons.edit));
                                    }
                                  )
                                ],
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'cid : ${userprovider.cid}',
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
                              child: !selected && userprovider.profilepic.isEmpty?
                              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSIHAgAt1qr3dZoRVKjpw4p2qddppl7TRnog&s')
                              :
                              !selected ? 
                              Image.network(userprovider.profilepic,fit: BoxFit.cover,)
                              :
                              Image.file(
                                  picked_image!,
                                  fit: BoxFit.cover,
                                  )
                            ),
                          ),
                          Positioned(
                            right: 0.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: (){
                                  pickProfileImages();
                                }, 
                                icon: Icon(
                                  CupertinoIcons.arrow_2_squarepath,
                                  color: Colors.black,
                                  )),
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
                        child: Profiletextbox(wins: userprovider.votes.length, text: 'Participated'),
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
                              '${{ userprovider.status }}',
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
                    TimelineWidget(status: userprovider.status,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  if(selected){
                    saveProfileImagesChanges(
                      picked_image!, 
                    userprovider.cid);
                  }
                },
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.teal.shade900
                  ),
                  child: Center(
                    child: Text(
                      'Save Changes',
                      style: GoogleFonts.kodeMono(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        )
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              InkWell(
                onTap: (){},
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.red.shade700
                  ),
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: GoogleFonts.kodeMono(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        )
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}