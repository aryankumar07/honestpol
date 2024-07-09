import 'package:flutter/material.dart';
import 'package:honestpol/features/auth/screen/admin_screen.dart';
import 'package:honestpol/features/auth/service/auth_service.dart';

class Pageviewscontainer extends StatelessWidget{

  final String Imageurl;
  final String text;
  final bool showButton;

  Pageviewscontainer({
    required this.Imageurl,
    required this.text,
    required this.showButton,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      width: MediaQuery.of(context).size.width*0.8,
      child: Column(
        children: [
          Image.asset(
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width*0.8,
            fit: BoxFit.cover,
            Imageurl),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              ),
          ),
          if(showButton)...[
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AdminScreen.routeName);
              }, 
              child: Text('Login/Signup -->'))
          ]
        ],
      ),
    );
  }
}