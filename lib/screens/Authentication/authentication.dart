import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leta_sasa/helpers/screen_navigation.dart';
import 'package:leta_sasa/screens/home.dart';
import 'package:leta_sasa/utils/app_colors.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBarColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LETASASa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        FormBuilderTypeAhead(
                          decoration: InputDecoration(
                            labelText: 'Country',
                          ),
                          name: 'country',
                          itemBuilder: (BuildContext context, itemData) {
                            return Text('hy');
                          },
                          suggestionsCallback: (String pattern) {
                            return null;
                          },
                        ),
                        FormBuilderPhoneField(
                          name: 'phone number',
                          decoration: InputDecoration(hintText: 'Phone number'),
                        ),
                      ],
                    ),
                  ],
                ),
            ),
            MaterialButton(
              color: Color(0xff24d875),
              onPressed: () => ChangeScreen(context, MyHomePage()),
            )
          ],
        ));
  }
}
