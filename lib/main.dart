import 'package:flutter/material.dart';
import 'package:honestpol/common_widgets/bottom_bar.dart';
import 'package:honestpol/features/auth/screen/admin_screen.dart';
import 'package:honestpol/features/auth/service/auth_service.dart';
import 'package:honestpol/features/onborading/screen/onborad_screen.dart';
import 'package:honestpol/providers/optionnameprovider.dart';
import 'package:honestpol/providers/pickedimagesprovider.dart';
import 'package:honestpol/providers/userprovider.dart';
import 'package:honestpol/routes.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Userprovider()),
        ChangeNotifierProvider(create: (context)=>Optionnameprovider()),
        ChangeNotifierProvider(create: (context)=>Pickedimagesprovider()),
      ],
      child: MyApp())
    );
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {

    final userprovider = Provider.of<Userprovider>(context,listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        onGenerateRoute: (settings) => GenerateRoute(settings),
        // home: OnboradScreen(),
        home: userprovider.user.token.isNotEmpty ?
        BottomBar()
        : OnboradScreen(),
      );
  }
}

