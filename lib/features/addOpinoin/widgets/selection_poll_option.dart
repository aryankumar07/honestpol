import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/providers/optionnameprovider.dart';
import 'package:provider/provider.dart';

class SelectionPollOption extends StatelessWidget{

  final String text;
  final int index;

  SelectionPollOption({
    super.key,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10),
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(14)),
            color: Colors.grey.shade800),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        if(value.isNotEmpty){
                          Provider.of<Optionnameprovider>(context)
                          .changeoption(value, index);
                        }
                      },
                      style: GoogleFonts.kodeMono(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: text
                      ),
                    )),
                  IconButton(
                    onPressed: (){
                      Provider.of<Optionnameprovider>(context,listen: false).deleteOption(index);
                    }, 
                    icon: Icon(Icons.delete)),
                ],
              ),
            ),
        ),
      );
  }
}