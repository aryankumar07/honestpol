import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/customcircle.dart';
import 'package:honestpol/features/home/service/home_service.dart';
import 'package:honestpol/features/home/widgets/creater_container.dart';
import 'package:honestpol/features/search/service/search_service.dart';
import 'package:honestpol/features/search/widget/poll_search_container.dart';
import 'package:honestpol/features/search/widget/search_widget.dart';
import 'package:honestpol/models/commentpoll.dart';
import 'package:honestpol/models/custompoll.dart';
import 'package:honestpol/models/user.dart';
import 'package:honestpol/models/yesnopoll.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final SearchService searchService = SearchService();
  final Homeservice homeservice = Homeservice();

  String squery = '';

  List<User> users=[];
  List<Commentpoll> commentpoll = [];
  List<YnPoll> ynpoll = [];
  List<CustomPoll> custompoll = [];
  List<dynamic> poll=[];
  List<dynamic> pollsuggestion=[];
  List<User> usersuggestion=[];

  void getuandp()async{
    users = await searchService.getusers(context: context);
    commentpoll = await homeservice.getCommentPoll(context: context);
    ynpoll = await homeservice.getynpoll(context: context);
    custompoll = await homeservice.getCustomPoll(context: context);
    poll = [...commentpoll,...ynpoll,...custompoll];
  }

  void searchuser(String query){
    String newquery = query.toLowerCase();
    List<User> newusersuggestion=[];
    usersuggestion = newusersuggestion;
    if(newquery!=""){
      usersuggestion = users.where((user) {
        String checker = user.cid.toLowerCase();
        return checker.contains(newquery);
      }).toList();
    }
    setState(() {});
  }

  void searchpoll(String query){
    String newquery = query.toLowerCase();
    List<dynamic> newpollsuggestion=[];
    pollsuggestion = newpollsuggestion;
    if(newquery!=""){
      pollsuggestion = poll.where((pol) {
        String checker = pol.pollid.toLowerCase();
        return checker.contains(newquery);
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    getuandp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Search',
                  style: GoogleFonts.kodeMono(
                    textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              actions: [
                Customcircleavatar(
                    outerRadius: 40,
                    innerRadius: 27,
                    iconsSize: 28,
                    icondata: CupertinoIcons.arrow_2_circlepath_circle)
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 82,
                    child: SearchWidget(
                        text: squery, 
                        onChanged: (query){
                          squery = query;
                          print(squery);
                          if(query.contains("C:")){
                            final queries = query.split(':');
                            searchuser(queries[1]);
                          }
                          else if(query.contains("P:")){
                            final queries = query.split(":");
                            searchpoll(queries[1]);
                          }
                        }, 
                        hintText: 'Search'),
                  ),
                ),
                Text(
                  "Write C:<creater id> to search for a creater",
                  style: GoogleFonts.kodeMono(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                Text(
                  "Write P:<poll id> to search for poll",
                  style: GoogleFonts.kodeMono(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),

                if(usersuggestion.length==0 && pollsuggestion.length==0)...[
                  SizedBox(height: 100,),
                  Text(
                    'Search Something Nothing to Show here',
                    style: GoogleFonts.kodeMono(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  )
                ]else...[
                  if(squery.contains("C:"))...[
                    SizedBox(height: 20,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: usersuggestion.length,
                        itemBuilder: (context,index){
                          return CreaterContainer(user: usersuggestion[index],search: true,);
                        }),
                    )
                  ]else...[
                    if(squery.contains("P:"))...[
                      SizedBox(height: 20,),
                      Expanded(
                        child: ListView.builder(
                          itemCount: pollsuggestion.length,
                          itemBuilder: (context,index){
                            return PollSearchcontainer(poll: poll[index]);
                          })
                      )
                    ]
                  ]
                ]

              ],
            )));
  }
}
