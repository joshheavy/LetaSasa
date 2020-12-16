import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leta_sasa/helpers/screen_navigation.dart';
import 'package:leta_sasa/screens/Authentication/register.dart';
import 'package:leta_sasa/screens/home.dart';
import 'package:leta_sasa/services/auth_service.dart';
import 'package:leta_sasa/utils/app_colors.dart';
import 'package:international_phone_input/international_phone_input.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBarColor,
        body: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'LETASASa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                FormBuilderTextField(name: 'email'),
                FormBuilderTextField(name: 'password'),
                MaterialButton(
                  color: Color(0xff24d875),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    ChangeScreen(context, RegisterPage());
                  },
                ),
                MaterialButton(
                  color: Color(0xff24d875),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.saveAndValidate()) {
                      UserCredential user = await _auth
                          .signInWithEmailandPassword(
                              email: _formKey.currentState.value['email'],
                              password: _formKey.currentState.value['password'])
                          .then((value) {
                        ChangeScreenReplacement(
                            context,
                            MyHomePage(
                              user: value,
                            ));
                        return value;
                      });
                    }
                  },
                )
              ],
            )));
  }
}
