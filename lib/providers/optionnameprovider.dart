import 'package:flutter/cupertino.dart';

class Optionnameprovider extends ChangeNotifier {
  List<String> _options = [
    "Option 1",
    "Option 2"
  ];

  List<String> get options => _options;

  void addToOptions(int index){
    options.add("Option ${index}");
    notifyListeners();
  }

  void deleteOption(int index){
    options.removeAt(index);
    notifyListeners();
  }

  void changeoption(String newname,int index){
    options[index] = newname;
    notifyListeners();
  }



}