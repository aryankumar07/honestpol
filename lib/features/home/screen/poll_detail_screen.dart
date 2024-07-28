import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/features/home/widgets/creater_container.dart';
import 'package:honestpol/features/home/widgets/question_container.dart';
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: QuestionContainer(poll: widget.arguments.poll,),
            ),
            if(widget.arguments.poll.commentphoto.isEmpty==false)...[
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
            ],
          ],
        ),
      ),
    );
  }
}