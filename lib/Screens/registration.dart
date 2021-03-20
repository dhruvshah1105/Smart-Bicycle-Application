import 'package:autoforest/Screens/home.dart';
import 'package:autoforest/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:autoforest/Screens/login.dart';

class RegistrationPage extends StatefulWidget {
  static String id = 'registration_page';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final AuthService _auth = AuthService();
  final _regkey = GlobalKey<FormState>();
  String _password, _valPassword, _email, _name, _phoneNo;
  String errormessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _regkey,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 100.0, left: 20.0, right: 20.0, bottom: 140.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Registration',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  TextFormField(
                    onChanged: (input) {
                      setState(() => _name = input);
                    },
                    validator: (input) =>
                        input.isEmpty ? 'Enter Full Name' : null,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    onChanged: (input) {
                      setState(() => _email = input);
                    },
                    validator: (input) => input.isEmpty ? 'Enter E-mail' : null,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    onChanged: (input) {
                      setState(() => _phoneNo = input);
                    },
                    validator: (input) =>
                        input.length < 10 ? 'Invalid Contact No' : null,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: Colors.black,
                      ),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    onChanged: (input) {
                      setState(() => _password = input);
                    },
                    obscureText: true,
                    validator: (input) => input.length < 6
                        ? 'Minimum 6 characters required'
                        : null,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    onChanged: (input) {
                      setState(() => _valPassword = input);
                    },
                    obscureText: true,
                    validator: (input) {
                      if (input.length < 6) {
                        return "Password didn't match";
                      }
                      if (_valPassword != _password) {
                        return "Password didn't match";
                      } else {
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 60.0,
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 10.0,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () async {
                        if (_regkey.currentState.validate()) {
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(_email, _password);
                          if (result == null) {
                            setState(() {
                              errormessage = 'Please enter valid E-mail';
                            });
                          }
                          else {
                            Navigator.of(context).pushReplacementNamed(Home.routeName);
                          }
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 30.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
