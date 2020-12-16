import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:leta_sasa/helpers/location_picker.dart';
import 'package:leta_sasa/helpers/screen_navigation.dart';
import 'package:leta_sasa/screens/Authentication/authentication.dart';
import 'package:leta_sasa/services/auth_service.dart';
import 'package:leta_sasa/services/geolocator_service.dart';
import 'package:leta_sasa/utils/app_colors.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key key}) : super(key: key);
  final pages = [
    PageViewModel(
        // pageColor: const Color(0xFF03A9F4),
        pageColor: AppColors.scaffoldColor,
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/images/location.png'),
        body: Text(
          'Browse the menu and order directly from the application',
        ),
        title: Text(
          'Tracking Realtime',
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/images/location.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/images/online-shopping.png',
      body: Text(
        'Your order will be immediately collected and delivered',
      ),
      title: Text('Order'),
      mainImage: Image.asset(
        'assets/images/online-shopping.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      // pageColor: const Color(0xFF607D8B),
      pageColor: AppColors.appBar2Color,
      iconImageAssetPath: 'assets/images/order-food.png',
      body: Text(
        'Pick up delivery at your door and enjoy groceries',
      ),
      title: Text('Shopping Request'),
      mainImage: Image.asset(
        'assets/images/order-food.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/images/place.png',
      body: Text(
        'Choose your location to start find the request around you',
      ),
      title: Text('Enable your Location'),
      mainImage: Image.asset(
        'assets/images/place.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        pages,
        showBackButton: true,
        showNextButton: true,
        onTapDoneButton: () {
         showCupertinoDialog(context: context, builder: (context)=>CupertinoActionSheet(
           actions: [
             CupertinoActionSheetAction(onPressed: (){
               ChangeScreen(context, AuthenticationScreen());
             }, child: Text("Login")),
             CupertinoActionSheetAction(onPressed: (){
               ChangeScreen(context, AddShopScreen());
             }, child: Text("Add shop")),
           ],
         ));

        },
      ),
    );
  }
}

class AddShopScreen extends StatefulWidget {
  @override
  _AddShopScreenState createState() => _AddShopScreenState();
}

class _AddShopScreenState extends State<AddShopScreen> {
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
                name: 'shop_name',
                decoration: InputDecoration(hintText: 'Shop Name'),
              ),
              FormBuilderDropdown(
                name: 'service_type',
                decoration: InputDecoration(
                  labelText: 'Service Type',
                  hintText: 'Select Service Type',
                  isDense: true,
                ),
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(context)]),
                items: ['Miraa', 'Drinks', 'Food & Grocery']
                    .map((gender) => DropdownMenuItem(
                    value: gender, child: Text('$gender')))
                    .toList(),
              ),
              FormBuilderDateTimePicker(
                name: 'opening_time',
                inputType: InputType.time,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'OPening time',
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Color(0xFF8E8E8E),
                  ),
                ),),
              FormBuilderDateTimePicker(
                name: 'closing_time',
                inputType: InputType.time,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Closing time',
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Color(0xFF8E8E8E),
                  ),
                ),),

              MaterialButton(onPressed: ()async{
                toggleLoading();

                if(_formKey.currentState.saveAndValidate()){
                  Position location=await GeolocatorService().getLocation();
                FirebaseFirestore.instance.collection('shops').doc().set(
                    {..._formKey.currentState.value,
                      'latitude':location.latitude,
                      'longitude':location.longitude
                    }).then((value) {
                  Navigator.pop(context);
                  toggleLoading();
                  return value;
                });}
              },child: Text("Add shop"),)

            ],
          ),
        ));
  }
}
