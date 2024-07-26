import 'dart:io';
import 'package:flutter/material.dart';

class Pickedimagesprovider extends ChangeNotifier {
  File? _picked_images=null;

  File? get pickedimages => _picked_images;

  void setimage(pickedimages){
    _picked_images = pickedimages;
    notifyListeners();
  }

}