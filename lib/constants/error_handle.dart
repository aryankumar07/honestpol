import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:http/http.dart';

void HttpErrorhandler({
  required BuildContext context,
  required Response response,
  required VoidCallback onPressed
}){
  switch(response.statusCode){
    case 200:
    print('entered here');
    onPressed();
    break;
    
    case 400:
    ShowSnackbar(context, jsonDecode(response.body)['msg']);
    break;
    
    case 500:
    ShowSnackbar(context, jsonDecode(response.body)['error']);
    break;
  }

}