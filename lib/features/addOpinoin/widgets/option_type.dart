import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionType extends StatelessWidget {
  final String text;
  final IconData icondata;
  final VoidCallback onPressed;

  OptionType({
    super.key,
    required this.icondata,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 2 - 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black),
          child: IconButton(
              onPressed: onPressed,
              icon: Row(
                children: [
                  Icon(icondata),
                  SizedBox(
                    width: 10,
                  ),
                  Text(text),
                ],
              )),
        ),
    );
  }
}
