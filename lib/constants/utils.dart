import 'package:flutter/material.dart';

void ShowSnackbar(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text))
  );
}

Widget showLine(){
  return Container(
    height: 1,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey
    ),
  );
}