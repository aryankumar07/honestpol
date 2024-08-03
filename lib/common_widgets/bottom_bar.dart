import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/custombottombutton.dart';
import 'package:honestpol/common_widgets/customcircle.dart';
import 'package:honestpol/features/addOpinoin/screen/add_opinion.dart';
import 'package:honestpol/features/chat/screen/chat_screen.dart';
import 'package:honestpol/features/home/screen/home_screen.dart';
import 'package:honestpol/features/profile/screen/profile_screen.dart';
import 'package:honestpol/features/search/screen/search_screen.dart';
import 'package:honestpol/providers/userprovider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {

  static const String routeName = '/bottom-bar';


  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int  _currentindex = 1;

  void changePage(int index){
    setState(() {
      _currentindex = index;
    });
  }

  List<Widget> bottombarwidgets= [
    HomeScreen(),
    SearchScreen(),
    AddopinionScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userprovider>(context,listen: false).user;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          backgroundColor: Colors.black87,
          iconSize: 28,
          onTap: changePage,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon:  Custombottombutton(
                  outerRadius: 30,
                  innerRadius: 30, 
                  iconsSize: 28, 
                  icondata: CupertinoIcons.square_grid_2x2_fill, 
                  selected: _currentindex==0 ? true : false),
            ),
            BottomNavigationBarItem(
              label: '',
              icon:  Custombottombutton(
                  outerRadius: 30,
                  innerRadius: 30, 
                  iconsSize: 28, 
                  icondata: CupertinoIcons.search, 
                  selected: _currentindex==1 ? true : false),
            ),
            BottomNavigationBarItem(
              label: '',
              icon:  Custombottombutton(
                  outerRadius: 30,
                  innerRadius: 30, 
                  iconsSize: 28, 
                  icondata: CupertinoIcons.add, 
                  selected: _currentindex==2 ? true : false),
            ),
            BottomNavigationBarItem(
              label: '',
              icon:  Custombottombutton(
                  outerRadius: 30,
                  innerRadius: 30, 
                  iconsSize: 28, 
                  icondata: CupertinoIcons.chat_bubble, 
                  selected: _currentindex==3 ? true : false),
            ),
            BottomNavigationBarItem(
              label: '',
              icon:  Custombottombutton(
                  outerRadius: 30,
                  innerRadius: 30, 
                  iconsSize: 28, 
                  icondata: CupertinoIcons.profile_circled, 
                  selected: _currentindex==4 ? true : false),
            ),
          ]),
          body: bottombarwidgets[_currentindex],
      ),
    );
  }
}