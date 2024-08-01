import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/constants/extensions.dart';
import 'package:honestpol/features/home/widgets/creater_container.dart';
import 'package:honestpol/features/home/widgets/options_container.dart';
import 'package:honestpol/features/home/widgets/question_container.dart';
import 'package:honestpol/features/home/widgets/review_container.dart';
import 'package:honestpol/features/home/widgets/yesno_conatiner.dart';
import 'package:honestpol/models/screen_arguments.dart';
import 'package:honestpol/models/user.dart';

class PollDetailScreen extends StatefulWidget {

  static const String routeName = '/home/poll-detail';

  final ScreenArguments arguments;

  const PollDetailScreen({
    super.key,
    required this.arguments
    });

  @override
  State<PollDetailScreen> createState() => _PollDetailScreenState();
}

class _PollDetailScreenState extends State<PollDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Poll Detail',
          style: GoogleFonts.kodeMono(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.white
            )
          ),
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CreaterContainer(user: widget.arguments.user,),
            ),
            if(widget.arguments.poll.type == "comment")...[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: QuestionContainer(poll: widget.arguments.poll,),
              ),
            ],
            if(widget.arguments.poll.type=="yn")...[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: YesnoConatiner(poll: widget.arguments.poll))
            ],
            if(widget.arguments.poll.type=="Selection")...[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OptionsContainer(poll: widget.arguments.poll),
              )
            ],
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '** Supporting Images **',
                style: GoogleFonts.kodeMono(
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  )
                ),
              ),
            ),
            if(widget.arguments.poll.type=="comment" && widget.arguments.poll.commentphoto.isEmpty==false)...[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.arguments.poll.commentphoto,
                    fit: BoxFit.cover,
                    height: 300.0,
                    width: double.infinity,
                  ),
                )
              )
            ]else if(widget.arguments.poll.type=="Selection" && widget.arguments.poll.customphoto.isEmpty==false)...[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.arguments.poll.customphoto,
                    fit: BoxFit.cover,
                    height: 300.0,
                    width: double.infinity,
                  ),
                )
              )
            ]else...[
              Text(
                'No Supporting Images Provided',
                style: GoogleFonts.kodeMono(
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                  )
                ),
              )
            ],
            SizedBox(height: 15,),
            if(widget.arguments.poll.type=="comment")...[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '** Other Review\'s **',
                  style: GoogleFonts.kodeMono(
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                    )
                  ),
                ),
              ),

                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.arguments.poll.comments.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ReviewContainer(comment: widget.arguments.poll.comments[index],)
                      );
                    }),
                ),
            ],
          ],
        ),
      ),
    );
  }
}