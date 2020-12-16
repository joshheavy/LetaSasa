import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leta_sasa/helpers/screen_navigation.dart';
import 'package:leta_sasa/screens/home.dart';
import 'package:leta_sasa/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool loading=false;

  toggleLoading(){
    setState(() {
      loading=!loading;
    });

  }

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return FormBuilder(
        key: _formKey,
        child: Scaffold(
          body: loading?Center(child: CircularProgressIndicator()):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'first_name',
                decoration: InputDecoration(hintText: 'Frist Name'),
              ),
              FormBuilderTextField(
                  name: 'last_name',
                  decoration: InputDecoration(hintText: 'Last Name')),
              FormBuilderTextField(
                  name: 'email',
                  decoration: InputDecoration(hintText: 'Email')),
              FormBuilderTextField(
                  name: 'password',
                  decoration: InputDecoration(hintText: 'password')),
              MaterialButton(
                child: Text("Register"),
                onPressed: () {
                  if (_formKey.currentState.saveAndValidate())
                    toggleLoading();
                    _auth
                        .createWithEmailandPassword(
                            email: _formKey.currentState.value['email'],
                            password: _formKey.currentState.value['password'])
                        .then((value) async {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(value.user.uid)
                          .set(_formKey.currentState.value);
                      toggleLoading();
                      ChangeScreen(context, MyHomePage(user: value,));
                    });
                },
              )
            ],
          ),
        ));
  }
}
