import 'package:autoforest/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'registration.dart';
import 'package:autoforest/Shared/loading.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;
  String _email, _password;
  String errormessage = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 80.0, left: 20.0, right: 20.0, bottom: 110.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/bicycle.png'),
                              height: 190.0,
                              width: 190.0,
                            ),
                            SizedBox(height: 0.0),
                            Text(
                              'SHC E-Bikes',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 45.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter email address';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (input) {
                                setState(() => _email = input);
                              },
                              decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                ),
                                labelText: 'E-mail',
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
                            TextFormField(
                              onChanged: (input) {
                                setState(() => _password = input);
                              },
                              obscureText: true,
                              validator: (input) {
                                if (input.length < 6) {
                                  return 'Enter proper password';
                                } else {
                                  return null;
                                }
                              },
                              decoration: new InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline,
                                    color: Colors.black),
                                suffixIcon: Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.black,
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black),
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () {},
                                  child: Text(
                                    'Forget Password?',
                                  ),
                                ),
                              ],
                            ),
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
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic result =
                                        _auth.signinWithEmailAndPassword(
                                            _email, _password);
                                    if (result == null) {
                                      setState(() {
                                        errormessage =
                                            'Please supply a valid E-mail and password';
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 30.0,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Text(errormessage),
                            SizedBox(height: 15.0),
                            Divider(
                              color: Colors.black,
                              thickness: 0.0,
                              indent: 50.0,
                              endIndent: 50.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () {},
                                  child: Image(
                                    height: 50.0,
                                    image: AssetImage('images/google.png'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Don't have an Account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign Up!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
