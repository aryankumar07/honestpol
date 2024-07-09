import 'package:flutter/material.dart';
import 'package:honestpol/models/user.dart';

class Userprovider extends ChangeNotifier {
  User _user = User(
    name: '',
    email: '', 
    cid: '', 
    status: '', 
    token: '', 
    profilepic: '', 
    votes: [],
    posts: [], 
    bio: '',
    id: '');

    User get user => _user;

    void setUser(String user){
      _user = User.fromJson(user);
      notifyListeners();
    }

}