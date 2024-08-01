import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/constants/extensions.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/features/home/service/home_service.dart';

class YesnoConatiner extends StatefulWidget {
  final dynamic poll;

  const YesnoConatiner({
    super.key,
    required this.poll,
  });

  @override
  State<YesnoConatiner> createState() => _YesnoConatinerState();
}

class _YesnoConatinerState extends State<YesnoConatiner> {

  final Homeservice homeservice = Homeservice();

  bool _voted = false;
  int _option = 0;
  double _yesouterpollwidth = 0.0;
  double _npouterpollwidth = 0.0;


  void addopinionandgetcount() async {
    List<int> counts = await homeservice.addYnOpinion(
      context: context, 
      option: _option, 
      pollid: widget.poll.pollid);

    int yesvotes = counts[0];
    int totalvotes = counts[1];
    int novotes = totalvotes - yesvotes;

    setState(() {
      _voted=true;
      if(yesvotes/totalvotes==0){
        _yesouterpollwidth = MediaQuery.of(context).size.width*0.1;  
      }else{
        _yesouterpollwidth = MediaQuery.of(context).size.width*(yesvotes/totalvotes);
      }

      if(novotes/totalvotes==0){
        _npouterpollwidth = MediaQuery.of(context).size.width*0.1;  
      }else{
        _npouterpollwidth = MediaQuery.of(context).size.width*(novotes/totalvotes);
      }
      
    });


  }


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

          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    if (_voted == false) {
                      _option = 1;
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: _voted == false
                            ? _option == 0
                                ? HexColor.fromHex('#E6E6FA')
                                : _option == 1
                                    ? HexColor.fromHex('#124559')
                                    : HexColor.fromHex('#E6E6FA')
                            : HexColor.fromHex('#124559')
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 12, bottom: 12),
                      child: Text(
                        _voted==false? 'Yes' : '',
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
                    width: _yesouterpollwidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: HexColor.fromHex('#E6E6FA')
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 12, bottom: 12),
                      child: Text(
                        _voted==false ? '' : 'Yes',
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
          ),

          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    if (_voted == false) {
                      _option = 2;
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: _voted == false
                            ? _option == 0
                                ? HexColor.fromHex('#E6E6FA')
                                : _option == 2
                                    ? HexColor.fromHex('#124559')
                                    : HexColor.fromHex('#E6E6FA')
                            : HexColor.fromHex('#124559')
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 12, bottom: 12),
                      child: Text(
                        _voted==false? 'No' : '',
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
                    width: _npouterpollwidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: HexColor.fromHex('#E6E6FA')
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 12, bottom: 12),
                      child: Text(
                        _voted==false ? '' : 'No',
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
          ),
          
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                if(_option==0){
                  ShowSnackbar(context, "To post select an opinion");
                }else{
                  addopinionandgetcount();
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
