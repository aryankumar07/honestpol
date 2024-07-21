import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:honestpol/constants/error_handle.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/locker.dart';
import 'package:honestpol/providers/userprovider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddopinionService {
  void addCommentPoll({
    required BuildContext context,
    required String question,
    required File commenturl,
    required Color colordata
  })async{
    try{
      final user = Provider.of<Userprovider>(context,listen: false).user;

      final cloudinary = CloudinaryPublic(cloudname, uploadpreset);

      CloudinaryResponse Cloudresponse = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(commenturl.path,folder: user.cid)
      );

      final commentphoto = Cloudresponse.secureUrl;
      final String color = colordata.toString();


      http.Response response = await http.post(
        Uri.parse('$baseUri/user/add-comment-poll'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charser=UTF-8',
          'x-auth-token' : user.token,
        },
        body: jsonEncode({
          'question' : question,
          'commentphoto' : commentphoto,
          'color' : color
        })
      );

      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          ShowSnackbar(context, 'added to mongo');
      });



    }catch(e){
      ShowSnackbar(context, e.toString());
    }
  }


  void addYesNoPoll({
    required BuildContext context,
    required String question,
    required Color colordata,
  })async{
    try{
      final user = Provider.of<Userprovider>(context,listen: false).user;
      final color = colordata.toString();
      http.Response response = await http.post(
        Uri.parse('$baseUri/user/add-yes-no-poll'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charser=UTF-8',
          'x-auth-token' : user.token,
        },
        body: jsonEncode({
          'question' : question,
          'color' : color
        })
      );

      HttpErrorhandler(
        context: context,
        response: response, 
        onPressed: (){
          ShowSnackbar(context, 'yes no Poll Created');
        });

    }catch(e){
      ShowSnackbar(context, e.toString());
    }
  }


}