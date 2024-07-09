import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:honestpol/common_widgets/bottom_bar.dart';
import 'package:honestpol/constants/error_handle.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/features/onborading/screen/onborad_screen.dart';
import 'package:honestpol/locker.dart';
import 'package:honestpol/models/user.dart';
import 'package:honestpol/providers/userprovider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void CreateUser({
    required BuildContext context,
    required String email,
    required String password,
    required String cid,
    required String name,
  })async{
    try{
      http.Response response = await http.post(
        Uri.parse('$baseUri/user/make-account'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          'email' : email,
          'password' : password,
          'cid' : cid,
          'name' : name,
        })
      );
      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          ShowSnackbar(context, 'Account has been Created ; Please login with the same credentials');
        });

    }catch(e){
      ShowSnackbar(context, e.toString());
    }
  }

  void loginUser({
    required BuildContext context,
    required String username,
    required String password,
  })async{
    try{
      print('entered in login');
      http.Response response = await http.get(
      Uri.parse('$baseUri/user/sigin'),
      headers: <String,String>{
        'Content-Type' : 'application/json; charset=UTF-8',
        'username' : username,
        'password' : password,
      }
    );

    HttpErrorhandler(
      context: context, 
      response: response, 
      onPressed: ()async{
        final User user = User.fromMap(jsonDecode(response.body));
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('x-auth-token', user.token);
        final userprovider = Provider.of<Userprovider>(context,listen: false);
        print(response.body);
        userprovider.setUser(response.body);
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (_)=>BottomBar()), 
          (Route<dynamic> route)=>false);
      });
    }catch(e){
      ShowSnackbar(context, e.toString());
    }
  }

  void getUserData({
    required BuildContext context,
  })async{
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('x-auth-token');
      print('the token is $token!');
      if(token==null){
        print('setting the token as empty');
        sharedPreferences.setString('x-auth-token', '');
      }

      http.Response tokenres = await http.get(
        Uri.parse('$baseUri/api/verify-token'),
        headers: <String,String>{
          'Content-Type' : 'application/json; chareset=UTF-8',
          'x-auth-token' : token!,
        }
      );


      final val = jsonDecode(tokenres.body);
      print(val);

      if(val==true){
        http.Response response = await http.get(
          Uri.parse('$baseUri/'),
          headers: <String,String>{
            'Content-Type' : 'application/json; charset=UTF-8',
            'x-auth-token' : token
          }
        );
        
        HttpErrorhandler(
          context: context, 
          response: response, 
          onPressed: (){
            final userprovider = Provider.of<Userprovider>(context,listen: false);
            userprovider.setUser(response.body);
            
          });
      }else{
        // ShowSnackbar(context, 'failed to fetch the data');
        Navigator.pushNamed(context, OnboradScreen.rouuteName);
      }

    }catch(e){
      // ShowSnackbar(context, e.toString());
      Navigator.pushNamed(context, OnboradScreen.rouuteName);
    }
  }



}

