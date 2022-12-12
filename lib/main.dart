import 'package:bmi_weight_tracker/constant/constant.dart';
import 'package:bmi_weight_tracker/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Weight Tracker',
      theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          appBarTheme: AppBarTheme(backgroundColor: primaryColor)),
      home: const BmiDataScreen(),
    );
  }
}
