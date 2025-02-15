import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/features/home/screen/poll_detail_screen.dart';
import 'package:honestpol/features/home/service/home_service.dart';
import 'package:honestpol/models/screen_arguments.dart';
// import 'package:honestpol/models/poll.dart';
import 'package:honestpol/models/user.dart';

class Pollcontainer extends StatefulWidget {
  final dynamic poll;

  const Pollcontainer({
    super.key,
    required this.poll,
  });

  @override
  State<Pollcontainer> createState() => _PollcontainerState();
}

class _PollcontainerState extends State<Pollcontainer> {
  Homeservice homeservice = Homeservice();
  Color _defaultcolor = Colors.blue;
  Color _defaultHeartcolor = Colors.white;
  String _name = "Creater Name";
  String _imageUrl = "";
  int _totallikes=0;
  bool _alreadyLiked=false;

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

  void getData() async {
    _defaultcolor = Color(int.parse(widget.poll.color.substring(6, 16)));
    _totallikes = widget.poll.likes.length;
    _alreadyLiked = await homeservice.liked(context: context, pollid: widget.poll.pollid, type: widget.poll.type);
    // print("in the inint ${_alreadyLiked}");
    user = await homeservice.getUserData(
        context: context, userid: widget.poll.userid);
    setState(() {});
  }

  void likes() async {
    bool liked = await homeservice.liked(context: context, pollid: widget.poll.pollid, type: widget.poll.type);

    if(liked){
      _alreadyLiked = false;
      _defaultHeartcolor = Colors.white;
      int res = await homeservice.decLikes(
          pollid: widget.poll.pollid, context: context, type: widget.poll.type);
      if(res>=0){
        setState(() {
          _totallikes=res;
        });
      }
    }else{
      _defaultHeartcolor = Colors.red;
      int res = await homeservice.incLikes(
          pollid: widget.poll.pollid, context: context, type: widget.poll.type);
      if(res>=0){
        setState(() {
          _totallikes = res;
        });
      }
    }

  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              Container(
                height: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: _defaultcolor),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            child: ClipOval(
                                child: user.profilepic.isEmpty
                                    ? Image.asset(
                                        'assets/images/profile_pic.png')
                                    : Image.network(user.profilepic)),
                            radius: 24,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            user.name.isEmpty
                                ? 'Creater Text'
                                : 'Created By : ${user.name}',
                            style: GoogleFonts.kodeMono(
                                textStyle: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Text(
                          widget.poll.question.isEmpty
                              ? 'Fetching the Question'
                              : widget.poll.question,
                          style: GoogleFonts.kodeMono(
                              textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade800,
                          )),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      if (widget.poll.type == "comment") ...[
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                final args =
                                    ScreenArguments(poll: widget.poll, user: user);
                                Navigator.of(context).pushNamed(
                                    PollDetailScreen.routeName,
                                    arguments: args);
                              },
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 2 + 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0, left: 30, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Write your Comment',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              widget.poll.pollid,
                              style: GoogleFonts.kodeMono(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                )
                              ),
                            )
                          ],
                        ),
                      ],
                      if (widget.poll.type == "yn") ...[
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                final args =
                                    ScreenArguments(poll: widget.poll, user: user);
                                Navigator.of(context).pushNamed(
                                    PollDetailScreen.routeName,
                                    arguments: args);
                              },
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 2 + 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0, left: 30, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Choose Yes or No',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              widget.poll.pollid,
                              style: GoogleFonts.kodeMono(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                )
                              ),
                            )
                          ],
                        ),
                      ],
                      if (widget.poll.type == "Selection") ...[
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                final args =
                                    ScreenArguments(poll: widget.poll, user: user);
                                Navigator.of(context).pushNamed(
                                    PollDetailScreen.routeName,
                                    arguments: args);
                              },
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 2 + 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0, left: 30, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pick An Option',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              widget.poll.pollid,
                              style: GoogleFonts.kodeMono(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                )
                              ),
                            )
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                right: -10,
                child: Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: Colors.black),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 2.0,
                child: Container(
                  height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: Colors.black),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: likes,
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: _alreadyLiked ? Colors.red :  _defaultHeartcolor,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${_totallikes}')
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            CupertinoIcons.share_solid,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('0')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
    ;
  }
}
