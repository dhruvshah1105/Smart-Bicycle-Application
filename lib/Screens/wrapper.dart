import 'package:autoforest/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  static String id = 'wrapper';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FireBaseUser>(context);
    print(user);
    //return either home or loginpage.
    if (user == null) {
      return LoginPage();
    } else {
      return Home();
    }
  }
}
