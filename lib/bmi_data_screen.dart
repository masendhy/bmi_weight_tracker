import 'package:bmi_weight_tracker/bmi_result_screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff251749),
      appBar: AppBar(
        title: Text('BMI Weight Tracker'),
      ),
      body: Column(children: [
        Expanded(
            child: Container(
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 52, 42, 80),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.male,
                      color: Colors.white,
                      size: 80,
                    ),
                    Text(
                      'Male',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 52, 42, 80),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.female,
                      color: Colors.white,
                      size: 80,
                    ),
                    Text(
                      'Female',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ))
            ],
          ),
        )),
        Expanded(
            child: Container(
          color: Colors.blue,
        )),
        Expanded(
            child: Container(
          color: Colors.green,
        )),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return BmiResultScreen();
            })));
          },
          child: Container(
            height: 60,
            child: Center(child: Text('Calculate BMI')),
          ),
        )
      ]),
    );
  }
}
