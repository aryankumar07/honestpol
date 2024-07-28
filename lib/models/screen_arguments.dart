import 'package:honestpol/models/user.dart';

class ScreenArguments{
  
  final User user;
  final dynamic poll;

  ScreenArguments({
    required this.poll,
    required this.user
  });
}