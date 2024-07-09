import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget{

  final TextEditingController controller;
  final String hintext;
  final IconData icondata;
  final int? maxlines;

  CustomTextfield({
    super.key,
    required this.controller,
    required this.hintext,
    required this.icondata,
    this.maxlines,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black
        ),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icondata),
            SizedBox(width: 10,),
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: maxlines!=null ? maxlines! : 1,
                decoration: InputDecoration(
                  hintText: hintext,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}