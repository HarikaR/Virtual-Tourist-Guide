import 'package:flutter/material.dart';
import 'package:vtg1flutter/constants.dart';
import 'package:vtg1flutter/components/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vtg1flutter/screens/welcome_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        email = value;
                      } else {
                        print('Enter a value for email.');
                      }
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      if (value != null) password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    title: 'Register',
                    colour: Colors.blueAccent,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email.trim(),
                          password: password,
                        );
                        if (newUser != null) {
                          Navigator.pushNamed(context, WelcomeScreen.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Registration Error!",
                          desc: "Login if already registered.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "COOL",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, WelcomeScreen.id),
                              width: 120,
                            )
                          ],
                        ).show();
                        print(e);
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
