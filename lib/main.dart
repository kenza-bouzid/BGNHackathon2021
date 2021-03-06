import 'package:flutter/material.dart';
import 'package:oreo_signs/constants.dart';
import 'package:oreo_signs/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OreoSign App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: aBackgroundColour,
        primaryColor: aPrimaryColour,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: aTextColour),
      ),
      home: HomeScreen(),
    );
  }
}
