import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimelineWidget extends StatefulWidget{
  final String status;

  TimelineWidget({
    super.key,
    required this.status,
  });

  @override
  State<TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: [
        Step(
          // isActive: widget.status=="Novice Predictor",
          isActive: _currentStep==0,
          title: Text(
            'Novice Predictor',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen.shade100
              )
              ),
          ), 
          content: Text(
            'Win 20 Polls To Reach The Next Level'
          )),
          Step(
          // isActive: widget.status=="Adept Analyst",
          isActive: _currentStep==1,
          title: Text(
            'Adept Analyst',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen.shade100
              )
              ),
          ), 
          content: Text(
            'Win 100 Polls To Reach The Next Level'
          )),
          Step(
            // isActive: widget.status=="Expert Forecaster",
            isActive: _currentStep==2,
          title: Text(
            'Expert Forecaster',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen.shade100
              )
              ),
          ), 
          content: Text(
            'Win 200 Polls To Reach The Next Level'
          )),
          Step(
            // isActive: widget.status=="Master Oracle",
            isActive: _currentStep==3,
          title: Text(
            'Master Oracle',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen.shade100
              )
              ),
          ), 
          content: Text(
            'Win 400 Polls To Reach The Next Level'
          )),
      ],
      onStepContinue: () {
        if(_currentStep!=3){
          setState(() {
            _currentStep+=1;
          });
        }else{
          setState(() {
            _currentStep=0;
          });
        }
      },
      onStepCancel: (){
        if(_currentStep!=0){
          setState(() {
            _currentStep-=1;
          });
        }else{
          setState(() {
            _currentStep=3;
          });
        }
      },
      currentStep: _currentStep,
    );
  }
}