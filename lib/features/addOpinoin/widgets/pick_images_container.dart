import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:honestpol/constants/utils.dart';
import 'package:honestpol/providers/pickedimagesprovider.dart';
import 'package:provider/provider.dart';

class PickImagesContainer extends StatefulWidget {
  const PickImagesContainer({
    super.key,
    });

  @override
  State<PickImagesContainer> createState() => _PickImagesContainerState();
}

class _PickImagesContainerState extends State<PickImagesContainer> {

  

  void pickimage(BuildContext context)async{
    File? picked_image;
    picked_image = await PickImages();
    if(picked_image!=null){
      Provider.of<Pickedimagesprovider>(context,listen: false).setimage(picked_image);
    }
  }


  @override
  Widget build(BuildContext context) {
    File? imagePicked = Provider.of<Pickedimagesprovider>(context,listen: true).pickedimages;
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
                onTap: (){
                  pickimage(context);
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
                      child: imagePicked==null ? Center(
                        child: Icon(Icons.photo),) :
                        Image.file(imagePicked,fit: BoxFit.fill,),
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