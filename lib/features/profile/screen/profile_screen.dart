import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/features/profile/screen/profile_settings.dart';
import 'package:honestpol/providers/userprovider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void navigateToprofileSettings(){
    Navigator.pushNamed(context, ProfileSettings.routeName);
  }

  @override
  Widget build(BuildContext context) {
  final dynamicuserProvider = Provider.of<Userprovider>(context,listen: true).user;
  final userProvider = Provider.of<Userprovider>(context,listen: false).user;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Account',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            )
            ),
            actions: [
              InkWell(
                onTap: navigateToprofileSettings,
                child: Customcircleavatar(
                  outerRadius: 40, 
                  innerRadius: 27, 
                  iconsSize: 28, 
                  icondata: Icons.settings),
              )
            ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.width/3,
                width: double.infinity,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: dynamicuserProvider.profilepic.isEmpty? 
                      NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSIHAgAt1qr3dZoRVKjpw4p2qddppl7TRnog&s')
                      : NetworkImage(dynamicuserProvider.profilepic),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dynamicuserProvider.name,
                            style: GoogleFonts.kodeMono(
                              textStyle: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              )
                            ),
                          ),
                          Text(
                            '@${userProvider.cid}',
                            style: GoogleFonts.kodeMono(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white
                              )
                            ),
                          ),
                          Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width-200,
                            child: Text(
                              dynamicuserProvider.bio.isEmpty? 
                              'No Bio Povided'
                              : dynamicuserProvider.bio,
                              style: GoogleFonts.caveat(
                                textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis
                              ),
                              ),
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width/2-60,
                      child: ElevatedButton(
                        onPressed: (){}, 
                        child: Text(
                          'Post ${userProvider.posts.length}'
                        )),
                    ),
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width/2+30,
                      child: ElevatedButton(
                        onPressed: (){}, 
                        child: Text(
                          'Contributions ${userProvider.votes.length}'
                        )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              showLine(),
            ],
          ),
        )
      ),
    );
  }
}