// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'package:bmi_weight_tracker/constant/constant.dart';
import 'package:bmi_weight_tracker/helpers/bmi_calculator.dart';
import 'package:bmi_weight_tracker/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.resultBmi});
  final double resultBmi;

// BMI Status
  // String determineBmiCategory(double bmiValue) {
  //   String category = "";
  //   if (bmiValue < 18.5) {
  //     category = underweight;
  //   } else if (bmiValue < 25) {
  //     category = healthyweight;
  //   } else if (bmiValue < 30) {
  //     category = preobesity;
  //   } else if (bmiValue >= 30) {
  //     category = obesity;
  //   }
  //   return category;
  // }

  // String getRiskDescription(String categoryName) {
  //   String desc = "";

  //   switch (categoryName) {
  //     case underweight:
  //       desc =
  //           'A BMI score of less than 18.5 indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice ';

  //       break;
  //     case healthyweight:
  //       desc =
  //           'Your BMI indicates that you are at a healty weight for your height. By maintaining a healty weight, you lower your risk of developng seriously health problems';
  //       break;
  //     case preobesity:
  //       desc =
  //           'A BMI score of 25 - 29.9 indicates that you are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or dietitian for advice.';
  //       break;
  //     case obesity:
  //       desc =
  //           'A BMI score of over 30 indicates that you are heavily overweight. Your health may be at risk if you do not lose weight. ou are recommended to talk to your doctor or dietitian for advice';

  //       break;
  //   }
  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(resultBmi);
    // final bmiCategory =
    bmiCalculator.determineBmiCategory();
    // final bmiDesc =
    bmiCalculator.getRiskDescription();

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Result Calculating BMI',
        style: TextStyle(color: Color(0xffFA7070)),
      )),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(children: [
          Expanded(
              child: Center(
            child: Text(
              'Result',
              style: TextStyle(
                  color: thirdColor, fontSize: 50, fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
              flex: 5,
              child: BmiCard(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your BMI Score is :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(11)),
                        child: Text(
                          resultBmi.toStringAsFixed(1),
                          style: resultStyle.copyWith(fontSize: 100),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(children: [
                          TextSpan(
                              text: bmiCalculator.bmiCategory ?? "",
                              style:
                                  resultStyle.copyWith(color: Colors.white70)),
                          const TextSpan(text: '\n\n'),
                          TextSpan(
                              text: bmiCalculator.bmiDesc ?? "",
                              style: resultStyle.copyWith(
                                  color: Colors.white38,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20)),
                        ]),
                      ),
                    ],
                  ),
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(7)),
              height: 60,
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
              child: const Center(
                  child: Text('Recalculate BMI',
                      style: TextStyle(
                          color: Color(0xffFA7070),
                          fontSize: 25,
                          fontWeight: FontWeight.bold))),
            ),
          )
        ]),
      ),
    );
  }
}
