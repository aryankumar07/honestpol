import 'package:flutter/cupertino.dart';

class Optionnameprovider extends ChangeNotifier {
  List<String> _options = [
    "Option 1",
    "Option 2"
  ];

  List<String> get options => _options;

  void addToOptions(int index){
    _options.add("Option ${index}");
    notifyListeners();
  }

  void deleteOption(int index){
    _options.removeAt(index);
    notifyListeners();
  }

  void changeoption(String newname,int index){
    _options[index] = newname;
    notifyListeners();
  }

  void resetoptions(){
    _options.clear();
    _options.add("options 1");
    _options.add("options 2");
    notifyListeners();
  }



}