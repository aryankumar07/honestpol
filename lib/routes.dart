import 'package:flutter/material.dart';
import 'package:honestpol/common_widgets/bottom_bar.dart';
import 'package:honestpol/features/addOpinoin/screen/comment_screen.dart';
import 'package:honestpol/features/addOpinoin/screen/custome_post_screen.dart';
import 'package:honestpol/features/addOpinoin/screen/yes_no_opinion_screen.dart';
import 'package:honestpol/features/auth/screen/admin_screen.dart';
import 'package:honestpol/features/home/screen/poll_detail_screen.dart';
import 'package:honestpol/features/model_screen/user_profile.dart';
import 'package:honestpol/features/onborading/screen/onborad_screen.dart';
import 'package:honestpol/features/profile/screen/profile_settings.dart';
import 'package:honestpol/models/screen_arguments.dart';
import 'package:honestpol/models/user.dart';

Route<dynamic> GenerateRoute(RouteSettings routesettings){
  switch(routesettings.name){

    case  AdminScreen.routeName :
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>AdminScreen());

    
    case OnboradScreen.rouuteName:
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>OnboradScreen());

    case ProfileSettings.routeName :
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>ProfileSettings());

    case YesNoOpinionScreen.routeName:
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>YesNoOpinionScreen());
    
    case CommentScreen.routeName:
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>CommentScreen());

    case CustomePostScreen.routeName:
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>CustomePostScreen());

    case PollDetailScreen.routeName:
    final ScreenArguments arguments = routesettings.arguments as ScreenArguments;
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>PollDetailScreen(arguments: arguments,));

    case UserProfile.routeName:
    final User user = routesettings.arguments as User;
    return MaterialPageRoute(
      settings: routesettings,
      builder: (_)=>UserProfile(user: user));

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