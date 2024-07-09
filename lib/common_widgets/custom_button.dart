import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  final VoidCallback onPressed;
  final String text;
  final IconData? icondata;

  CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icondata
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(icondata!=null)...[
              Icon(icondata)
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
              )
          ],
        ),
      ),
    );
  }
}