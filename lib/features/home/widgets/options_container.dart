import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/constants/extensions.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/features/home/service/home_service.dart';
import 'package:honestpol/features/home/widgets/option_stack.dart';

class OptionsContainer extends StatefulWidget {
  final dynamic poll;

  const OptionsContainer({
    super.key,
    required this.poll,
  });

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  final Homeservice homeservice = Homeservice();

  bool _voted = false;
  int _option = 0;
  double outerpollwidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor.fromHex('#F4CBC6'),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Question',
              style: GoogleFonts.kalam(
                  textStyle: TextStyle(fontSize: 26, color: Colors.black)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Text(
              widget.poll.question,
              maxLines: 3,
              style: GoogleFonts.kalam(
                  textStyle: TextStyle(fontSize: 26, color: Colors.black)),
            ),
          ),

          
          Container(
            height: 230,
            width: double.infinity,
            child: ListView.builder(
                itemCount: widget.poll.options.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      print('pressing the options');
                      setState(() {
                        _option = index+1;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      // decoration: BoxDecoration(color: Colors.black),
                      child: OptionStack(
                          voted: _voted, 
                          option: _option, 
                          index: index+1,
                          outerpollwidth: outerpollwidth,
                          name: widget.poll.options[index],
                          ),
                    ),
                  );
                }),
          ),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left : 15.0,right: 15,top: 15),
            child: InkWell(
              onTap: () {
                if (_option == 0) {
                  ShowSnackbar(context, "To post select an opinion");
                } else {}
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
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 22)),
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
