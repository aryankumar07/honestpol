import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/constants/extensions.dart';
import 'package:honestpol/features/home/service/home_service.dart';
import 'package:honestpol/models/comment.dart';
import 'package:honestpol/models/user.dart';

class ReviewContainer extends StatefulWidget {

  final Comment comment;

  ReviewContainer({
    super.key,
    required this.comment
  });

  @override
  State<ReviewContainer> createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {

  final Homeservice homeservice = Homeservice();

  User? user=null;

  void getuser()async{
    user = await homeservice.getUserData(context: context, userid: widget.comment.voterid);
    setState(() {});
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        color: HexColor.fromHex('#EAEAEA'),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: user==null? 
      Center(
        child: Text(
          'Could Not find Review',
          style: GoogleFonts.kodeMono(
            textStyle: TextStyle(
              color: HexColor.fromHex('#FF7F50'),
              fontSize: 22,
            )
          ),
        ),
      ) :
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              user!.name,
              style: GoogleFonts.kodeMono(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                )
              ),
            ),
          ),
          Container(
            width: 180,
            child: Text(
              widget.comment.comment,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.kodeMono(
                textStyle: TextStyle(
                  fontSize: 18,
                  color: HexColor.fromHex('#FF7F50'),
                )
              ),
            ),
          )
        ],
      )
    );
  }
}
