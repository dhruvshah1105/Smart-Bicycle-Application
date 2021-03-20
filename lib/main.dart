import 'package:autoforest/Models/user.dart';
import 'package:autoforest/Screens/home.dart';
import 'package:autoforest/Screens/registration.dart';
import 'package:autoforest/Screens/wrapper.dart';
import 'package:autoforest/Services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autoforest/Screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AutoForest());
}

class AutoForest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FireBaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Wrapper.id,
        routes: {
          Wrapper.id: (context) => Wrapper(),
          LoginPage.routeName: (context) => LoginPage(),
          RegistrationPage.id: (context) => RegistrationPage(),
          Home.routeName: (context) => Home()
        },
      ),
    );
  }
}
