import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:honestpol/constants/error_handle.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/locker.dart';
import 'package:honestpol/models/user.dart';
import 'package:http/http.dart' as http;

class SearchService {
  Future<List<User>> getusers({
    required BuildContext context,
  })async{

    List<User> users=[];

    try{
      http.Response response = await http.get(
        Uri.parse('$baseUri/home/all_user'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charser=UTf-8'
        }
      );
      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          final data = jsonDecode(response.body);
          for(int i=0;i<data.length;i++){
            users.add(User.fromJson(jsonEncode(data[i])));
          }
        });
    }catch(e){
      ShowSnackbar(context, "Unable to fetch user try again");
    }
    return users;
  }
}