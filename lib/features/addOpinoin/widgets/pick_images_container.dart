import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:honestpol/constants/utils.dart';

class PickImagesContainer extends StatefulWidget {
  const PickImagesContainer({super.key});

  @override
  State<PickImagesContainer> createState() => _PickImagesContainerState();
}

class _PickImagesContainerState extends State<PickImagesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.remove)),
            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                List<File> picked_images = await PickMultipleImage();
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: Icon(Icons.photo),
                    ),
                  ),
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}