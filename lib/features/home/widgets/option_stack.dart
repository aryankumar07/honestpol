import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/constants/extensions.dart';

class OptionStack extends StatelessWidget{

  bool voted;
  int option;
  int index;
  double outerpollwidth;
  String name;

  OptionStack({
    super.key,
    required this.voted,
    required this.option,
    required this.index,
    required this.outerpollwidth,
    required this.name,
  });



  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: voted == false
                            ? option == 0
                                ? HexColor.fromHex('#E6E6FA')
                                : option == index
                                    ? HexColor.fromHex('#124559')
                                    : HexColor.fromHex('#E6E6FA')
                            : HexColor.fromHex('#124559')
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 12, bottom: 12),
                      child: Text(
                        voted==false? name : '',
                        style: GoogleFonts.kodeMono(
                            textStyle: TextStyle(
                                fontSize: 24,
                                color: HexColor.fromHex('#01161E'))),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {},
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 52,
                    width: outerpollwidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: HexColor.fromHex('#E6E6FA')
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 12, bottom: 12),
                      child: Text(
                        voted==false ? '' : name ,
                        style: GoogleFonts.kodeMono(
                            textStyle: TextStyle(
                                fontSize: 24,
                                color: HexColor.fromHex('#01161E'))),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}