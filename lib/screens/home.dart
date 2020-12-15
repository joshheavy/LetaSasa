import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leta_sasa/utils/app_colors.dart';
import 'package:leta_sasa/widgets/home_card.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
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
          children: [
            HomeCard(icon: FontAwesomeIcons.cocktail, text: 'Drinks',),
            HomeCard(icon: FontAwesomeIcons.leaf, text: 'Miraa'),
            HomeCard(icon: FontAwesomeIcons.shoppingBag, text: 'Food & Grocery'),
          ],
        ),
      ),
    );
  }
}
