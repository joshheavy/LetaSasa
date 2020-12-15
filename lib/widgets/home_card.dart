import 'package:flutter/material.dart';
import 'package:leta_sasa/helpers/screen_navigation.dart';
import 'package:leta_sasa/screens/details.dart';
import 'package:leta_sasa/utils/app_colors.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String text;
  const HomeCard({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColors.appBar2Color,
        child: InkWell(
          onTap: () {
            ChangeScreen(context, DetailsPage());
          },
          splashColor: AppColors.scaffoldColor,
          child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 60.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
