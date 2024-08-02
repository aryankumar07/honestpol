import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:honestpol/constants/error_handle.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/locker.dart';
import 'package:honestpol/models/commentpoll.dart';
import 'package:honestpol/models/custompoll.dart';
import 'package:honestpol/models/user.dart';
import 'package:honestpol/models/yesnopoll.dart';
import 'package:honestpol/providers/userprovider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Homeservice{
  Future<List<Commentpoll>> getCommentPoll({
    required BuildContext context,
  }) async {
    final user = Provider.of<Userprovider>(context,listen: false).user;
    List<Commentpoll> commentpolls = [];
    try{
      http.Response response = await http.get(
        Uri.parse('$baseUri/home/get_comment_poll'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : user.token
        }
      );
      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          final list = jsonDecode(response.body);
          for(int i=0;i<list.length;i++){
            commentpolls.add(
              Commentpoll.fromJson(jsonEncode(list[i]))
            );
          }
        });
    }catch(e){
      ShowSnackbar(context, e.toString());
    }
    return commentpolls;
  }

  Future<User> getUserData({
    required BuildContext context,
    required String userid,
  })async{
    User user = User(
      email: '', 
      cid: '', 
      status: '', 
      token: '', 
      profilepic: '', 
      votes: [], 
      id: '', 
      name: '', 
      posts: [], 
      bio: '');
    try{
      http.Response response = await http.get(
        Uri.parse('$baseUri/home/get_user'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'userid' : userid
        }
      );
      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          // print(response.body);
          user = User.fromJson(response.body);
        });
    }catch(e){
      ShowSnackbar(context, e.toString());
    }
    return user;
  }


  Future<List<YnPoll>> getynpoll({
    required BuildContext context,
  })async{
    // print('fetching the yn polls in homeservice');
    List<YnPoll> ynpolls = [];
    try{
      http.Response response = await http.get(
        Uri.parse('$baseUri/home/get_ynpoll'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
        }
      );
      // print(response.body);
      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          final list = jsonDecode(response.body);
          for(int i=0;i<list.length;i++){
            ynpolls.add(
              YnPoll.fromJson(jsonEncode(list[i]))
            );
          }
        });

    }catch(e){
      ShowSnackbar(context, e.toString());
    }
    return ynpolls;
  }

  Future<List<CustomPoll>> getCustomPoll({
    required BuildContext context
  })async{
    List<CustomPoll> custompolls = [];
    try{
      http.Response response = await http.get(
        Uri.parse('$baseUri/home/get-custom-poll'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8'
        }
      );
      HttpErrorhandler(
        context: context,
        response: response, 
        onPressed: (){
          final list = jsonDecode(response.body);
          for(int i=0;i<list.length;i++){
            custompolls.add(
              CustomPoll.fromJson(jsonEncode(list[i]))
            );
          }
        });
    }catch(e){
      ShowSnackbar(context, e.toString());
    }
    return custompolls;
  }

  void addComment({
    required BuildContext context,
    required String comment,
    required String pollid,
    required VoidCallback commentadded
  })async{
    final user = Provider.of<Userprovider>(context,listen: false).user;
    try{
      http.Response response = await http.post(
        Uri.parse('$baseUri/user/add-comment'),
          headers: <String,String>{
            'Content-Type' : 'application/json; charset=UTF-8',
            'x-auth-token' : user.token
          },
          body: jsonEncode({
            'comment' : comment,
            'pollid' : pollid
          })
        );

        HttpErrorhandler(
          context: context, 
          response: response, 
          onPressed: (){
            commentadded();
          });

    }catch(e){
      ShowSnackbar(context, e.toString());
    }
  }


  Future<List<int>> addYnOpinion({
    required BuildContext context,
    required int option,
    required String pollid
  })async{
    final user = Provider.of<Userprovider>(context,listen: false).user;
    List<int> votescount=[];
    try{
      http.Response response = await http.post(
        Uri.parse('$baseUri/user/add-yn-opinion'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : user.token
        },
        body: jsonEncode({
          'option' : option,
          'pollid' : pollid
        })
      );

      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          final data = jsonDecode(response.body);
          votescount.add(data['yescount']);
          votescount.add(data['totalvotes']);
        });


    }catch(e){
      ShowSnackbar(context, e.toString());
    }

    return votescount;
  }

  Future<Map<String,dynamic>> addCustomopinion({
    required BuildContext context,
    required String option,
    required List<String> options,
    required String pollid
  })async{
    final user = Provider.of<Userprovider>(context,listen: false).user;
    Map<String,dynamic> countvotes={};
    try{
      http.Response response = await http.post(
        Uri.parse('$baseUri/user/custom-add-opinion'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : user.token
        },
        body: jsonEncode({
          'option' : option,
          'pollid' : pollid,
          'options' : options 
        })
      );

      HttpErrorhandler(
        context: context, 
        response: response, 
        onPressed: (){
          Map<String,dynamic> data = jsonDecode(response.body)['countedvotes'] as Map<String,dynamic>;
          countvotes.addAll(data);
        });

    }catch(e){
      ShowSnackbar(context, e.toString());
    }

    return countvotes;
  }


}