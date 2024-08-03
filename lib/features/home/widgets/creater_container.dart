import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/constants/extensions.dart';
import 'package:honestpol/features/model_screen/user_profile.dart';
import 'package:honestpol/models/user.dart';

class CreaterContainer extends StatelessWidget {

  final User user;
  final bool search;


  const CreaterContainer({
    super.key,
    required this.user,
    this.search=false
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor.fromHex('#124559'),
              borderRadius: BorderRadius.all(Radius.circular(18))
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.profilepic),
                      radius: 50,
                    ),
                    SizedBox(width: 50,),
                    Column(
                      children: [
                        if(search==false)...[
                          Text('This Poll was created By : '),
                        ],
                        Text(
                          '${user.name}',
                          style: GoogleFonts.kodeMono(
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.red.shade400
                            )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/2-20,),
                    Text('Creater\'s Tag : ${user.cid}')
                  ],
                )
              ],
            ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width/2-40,
            decoration: BoxDecoration(
              color: HexColor.fromHex('#E6E6FA'),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)
                )
            ),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(UserProfile.routeName,arguments: user);
              },
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 5,),
                    Text(
                      'More Info',
                      style: GoogleFonts.sourceCodePro(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                        )
                      ),
                      ),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                  ],
                ),
              ),
            )
          ),
        )
      ],
    );
  }
}