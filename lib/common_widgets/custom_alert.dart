import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honestpol/constants/extensions.dart';

class CustomAlertDialog extends StatelessWidget {

  final VoidCallback onPressed;

  const CustomAlertDialog({
    super.key,
    required this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];

    children.add(
      Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
          bottom: 15),
        child: new Container(
          height: 40,
          width: 400,
          decoration: BoxDecoration(
            color: HexColor.fromHex('#5B7B7A'),
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Text(
            'Commit Your Opinion',
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 24,
                color: Colors.white
              )
            ),
            ),
        ),
      )
    );

    children.add(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Container(
          height: 200,
          width: 400,
          child: Text(
            'Are You Sure You To commit Your Opinion Cause after Commitint there will be no changes',
            maxLines: 4,
            style: GoogleFonts.kodeMono(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.white
              )
            ),
          ),
        ),
      )
    );

    children.add(
      InkWell(
        onTap: onPressed,
        child: new Container(
          height: 52,
          width: 400,
          decoration: BoxDecoration(
            color: HexColor.fromHex('#B48E92'),
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Center(
            child: Text(
              'Commit Change',
              style: GoogleFonts.kodeMono(
                textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                )
              ),
              ),
          ),
        ),
      )
    );

    Widget dialogChild = new IntrinsicWidth(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    return new Dialog(child: dialogChild);
  }
}