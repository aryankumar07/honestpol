import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:honestpol/constants/error_handle.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/locker.dart';
import 'package:honestpol/models/user.dart';
import 'package:honestpol/providers/userprovider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProfileService {
  void saveProfileImagesChanges({
    required BuildContext context,
    required File profilepic,
    required String cid,
  })async{
    final userprovider = Provider.of<Userprovider>(context,listen: false);
    try{

      final cloudinary =  CloudinaryPublic(cloudname, uploadpreset);
      CloudinaryResponse res = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(profilepic.path,folder: cid)
      );

      final profilePicUrl = res.secureUrl; 
      print(profilePicUrl);
      http.Response response = await http.post(
        Uri.parse('$baseUri/user/save-profile-image'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token
        },
        body: jsonEncode({
          'profilepic' : profilePicUrl
        })
      );

      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          User user = userprovider.user.copyWith(
            profilepic: jsonDecode(response.body)['profilepic']
          );
          userprovider.setUserFromModel(user);
        });

    }catch(e){
      ShowSnackbar(context, e.toString());
    }
  }

  void saveProfileNameChanges({
    required BuildContext context,
    required String newname,
  })async{
    final userprovider = Provider.of<Userprovider>(context,listen: false);
    try{
      http.Response response = await http.post(
        Uri.parse('$baseUri/user/save-profile-name'),
        headers: <String,String>{
          'Content-type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token
        },
        body: jsonEncode({
          'name' : newname
        })
      );

      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          User user = userprovider.user.copyWith(
            name: jsonDecode(response.body)['name']
          );
          userprovider.setUserFromModel(user);
        });

    }catch(e){
      ShowSnackbar(context, e.toString());
    }
  }



}