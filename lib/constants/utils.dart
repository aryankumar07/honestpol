import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void ShowSnackbar(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text))
  );
}

Widget showLine(){
  return Container(
    height: 1,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey
    ),
  );
}

Future<File> PickImages()async{
  File profileimage=File('');
  try{
    FilePickerResult? picked_image = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image
    );
    if(picked_image!=null){
      profileimage = File(picked_image.files.single.path!);
    }
  }catch(e){
    debugPrint(e.toString());
  }

  return profileimage;
}


Future<List<File>> PickMultipleImage()async{
  List<File> PickedImages=[];
  try{
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image
    );

    if(result!=null && result.files.isNotEmpty){
      for(int i=0;i<result.files.length;i++){
        PickedImages.add(
          File(result.files[i].path!)
        );
      }
    }
  }catch(e){
    debugPrint(e.toString());
  }
  return PickedImages;
}