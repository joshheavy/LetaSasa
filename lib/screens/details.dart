import 'package:flutter/material.dart';
import 'package:leta_sasa/utils/app_colors.dart';
import 'package:leta_sasa/widgets/detail_card.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DetailsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.anotherColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBar2Color,
        title: Text(
          'LETASASa',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            FormBuilder(
              key: _formKey,
              child: Container(
                height: 50,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FormBuilderTextField(
                  name: 'search',
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8, right: 8),
                    hintText: 'Search...',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ), 
            DetailCard(title: 'Kwirk Grocery', distance: "1",),
            DetailCard(title: 'Star Grocery', distance: "5",),
            DetailCard(title: 'Seven Eleven', distance: "4",),
            DetailCard(title: 'Allhain', distance: "2", ),
            DetailCard(title: 'Kwirk Grocery', distance: "3",),
          ],
        ),
      ),
    );
  }
}
