import 'package:flutter/material.dart';
import 'package:leta_sasa/screens/intro_screen.dart';
import 'package:leta_sasa/services/geolocator_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final locatorService = GeolocatorService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => locatorService.getLocation(),
      child: MaterialApp(
        title: 'LETASASa',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: IntroScreen(),
      ),
    );
  }
}



