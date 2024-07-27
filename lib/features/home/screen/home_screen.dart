import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';
import 'package:honestpol/features/home/service/home_service.dart';
import 'package:honestpol/features/home/widgets/pollContainer.dart';
import 'package:honestpol/models/comment.dart';
import 'package:honestpol/models/commentpoll.dart';
import 'package:honestpol/models/custompoll.dart';
import 'package:honestpol/models/yesnopoll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Homeservice homeservice = Homeservice();
  List<Commentpoll> commentpoll = [];
  List<YnPoll> ynpoll = [];
  List<CustomPoll> custompoll = [];
  List<dynamic> allpolls=[];

  void getCommentPoll() async {
    commentpoll = await homeservice.getCommentPoll(context: context);
    ynpoll = await homeservice.getynpoll(context: context);
    custompoll = await homeservice.getCustomPoll(context: context);
    allpolls = [...commentpoll,...ynpoll,...custompoll];
    // print(allpolls);
    setState(() {});
  }

  @override
  void initState() {
    getCommentPoll();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text(
            'honestpoll',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            )
            ),
            actions: [
              Customcircleavatar(
                outerRadius: 40, 
                innerRadius: 27, 
                iconsSize: 28, 
                icondata: Icons.notifications_none_rounded)
            ],
        ),
        body: commentpoll.length==0 ? 
        Text('working on it') : 
        ListView.builder(
          itemCount: allpolls.length,
          itemBuilder: (context,index){
            return Pollcontainer(poll: allpolls[index],);
          }),
      ),
    );
  }
}