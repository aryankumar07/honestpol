import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/common_widgets/custom_alert.dart';
import 'package:honestpol/constants/extensions.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/features/home/service/home_service.dart';

class QuestionContainer extends StatefulWidget {

  final dynamic poll;


  const QuestionContainer({
     super.key,
     required this.poll
     });

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {

  final TextEditingController commentController = TextEditingController();

  final Homeservice homeservice = Homeservice();


  void showalertDialogue(){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return CustomAlertDialog(onPressed: (){
          homeservice.addComment(
            context: context, 
            comment: commentController.text, 
            pollid: widget.poll.pollid, 
            commentadded: (){
              commentController.text = '';
              Navigator.pop(context);
              ShowSnackbar(context, 'Your opinion has been added');
            });
        },);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor.fromHex('#F4CBC6'),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
            child: Text(
              'Question',
              style: GoogleFonts.kalam(
                textStyle: TextStyle(
                  fontSize: 26,
                  color: Colors.black
                )
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,top: 20),
            child: Text(
              widget.poll.question,
              maxLines: 3,
              style: GoogleFonts.kalam(
                  textStyle: TextStyle(
                    fontSize: 26,
                    color: Colors.black
                  )
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: [10,4],
              color: Colors.black,
              child: TextFormField(
                controller: commentController,
                maxLines: 7,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
                decoration: InputDecoration(
                  hintText: 'Comment',
                ),
              )),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: (){
                if(commentController.text.isEmpty){
                  ShowSnackbar(context, "Enter your opinion to post");
                }else{
                  showalertDialogue();
                }
              },
              child: Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor.fromHex('#B48E92'),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Center(
                  child: Text(
                    "Post",
                    style: GoogleFonts.kodeMono(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                      )
                    ),
                    ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}