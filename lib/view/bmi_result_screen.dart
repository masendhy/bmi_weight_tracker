// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:bmi_weight_tracker/constant/constant.dart';
import 'package:bmi_weight_tracker/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.resultBmi});
  final double resultBmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Result Calculating BMI',
        style: TextStyle(color: Color(0xffFA7070)),
      )),
      body: Column(children: [
        Expanded(
            child: Container(
          child: Center(
            child: Text(
              'Result',
              style: TextStyle(
                  color: thirdColor, fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        )),
        Expanded(
            flex: 5,
            child: BmiCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${resultBmi.toStringAsFixed(1)}',
                      style: resultStyle.copyWith(fontSize: 100),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Healty Weight \n',
                          style: resultStyle.copyWith(color: Colors.white70)),
                      TextSpan(
                          text:
                              'Your BMI indicates that you are at a healty weight for your height. By maintaining a healty weight, you lower your risk of developng seriously health problems',
                          style: resultStyle.copyWith(
                              color: Colors.white38,
                              fontWeight: FontWeight.normal,
                              fontSize: 20)),
                    ])),
                  ],
                ),
              ),
            )),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(color: secondaryColor),
            height: 60,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: const Center(
                child: Text('Recalculate BMI',
                    style: TextStyle(
                        color: Color(0xffFA7070),
                        fontSize: 25,
                        fontWeight: FontWeight.bold))),
          ),
        )
      ]),
    );
  }
}
