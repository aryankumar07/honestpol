import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/features/home/screen/poll_detail_screen.dart';
import 'package:honestpol/features/home/service/home_service.dart';
import 'package:honestpol/models/screen_arguments.dart';
import 'package:honestpol/models/user.dart';

class PollSearchcontainer extends StatefulWidget {
  final dynamic poll;

  PollSearchcontainer({super.key, required this.poll});

  @override
  State<PollSearchcontainer> createState() => _PollSearchcontainerState();
}

class _PollSearchcontainerState extends State<PollSearchcontainer> {
  Homeservice homeservice = Homeservice();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: ListTile(
                  title: Text(widget.poll.pollid,
                      style: GoogleFonts.kodeMono(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black))),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () async {
                User? user;
                user = await homeservice.getUserData(
                    context: context, userid: widget.poll.userid);
                if (user != null) {
                  final args = ScreenArguments(poll: widget.poll, user: user);
                  Navigator.of(context)
                      .pushNamed(PollDetailScreen.routeName, arguments: args);
                }
              },
              child: Container(
                height: 100,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: Colors.white)),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 22,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
