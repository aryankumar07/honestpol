import 'package:flutter/material.dart';
import 'package:honestpol/common_widgets/bottom_bar.dart';
import 'package:honestpol/features/auth/screen/admin_screen.dart';
import 'package:honestpol/features/onborading/screen/onborad_screen.dart';

Route<dynamic> GenerateRoute(RouteSettings routesettings){
  switch(routesettings.name){

    case  AdminScreen.routeName :
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>AdminScreen());

    case BottomBar.routeName :
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>BottomBar());
    
    case OnboradScreen.rouuteName:
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>OnboradScreen());

    default:
    return MaterialPageRoute(
      builder: (_)=>
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.arrow_back_ios)),
            title: Text('Error Route'),
        ),
        body: Center(
          child: Text(
            'No Routes of This name found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            )
        ),
      ));
  }
}