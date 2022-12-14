import 'package:bmi_weight_tracker/constant/constant.dart';
import 'package:bmi_weight_tracker/view/bmi_result_screen.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 60;
  int age = 20;
  String? gender;

  double calculateBmi() {
    double heightInMeter = height / 100;

    final h = (heightInMeter * heightInMeter);
    double resultBmi = weight / h;
    return resultBmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI Weight Tracker',
            style: TextStyle(color: Color(0xffFA7070)),
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                gender = "male";
                setState(() {});
              },
              child: BmiCard(
                borderColor: (gender == "male") ? thirdColor : primaryColor,
                child: const GenderIconText(title: 'MALE', icon: Icons.male),
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  gender = "female";
                  setState(() {});
                },
                child: BmiCard(
                    borderColor:
                        (gender == "female") ? thirdColor : primaryColor,
                    child: const GenderIconText(title: 'FEMALE', icon: Icons.female)),
              ),
            )
          ],
        )),
        Expanded(
            child: BmiCard(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'HEIGHT',
              style: labelTextSTyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('$height', style: numberStyle),
                Text(
                  'cm',
                  style: labelTextSTyle,
                )
              ],
            ),
            Slider(
              activeColor: primaryColor,
              inactiveColor: Colors.white24,
              thumbColor: const Color(0xffFA7070),
              value: height.toDouble(),
              min: 80,
              max: 200,
              onChanged: (value) {
                height = value.toInt();
                setState(() {});
              },
            )
          ],
        ))),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: labelTextSTyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$weight',
                    style: numberStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          weight++;
                          setState(() {});
                        },
                        shape: const CircleBorder(),
                        fillColor: primaryColor,
                        // elevation: 0,
                        child: const Icon(
                          Icons.add,
                          color: Color(0xffFA7070),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          weight--;
                          setState(() {});
                        },
                        shape: const CircleBorder(),
                        fillColor: primaryColor,
                        // elevation: 0,
                        child:
                            const Icon(Icons.remove, color: Color(0xffFA7070)),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Expanded(
                child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AGE',
                    style: labelTextSTyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$age',
                    style: numberStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          age++;
                          setState(() {});
                        },
                        shape: const CircleBorder(),
                        fillColor: primaryColor,
                        // elevation: 0,
                        child: const Icon(
                          Icons.add,
                          color: Color(0xffFA7070),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          age--;
                          setState(() {});
                        },
                        shape: const CircleBorder(),
                        fillColor: primaryColor,
                        // elevation: 0,
                        child:
                            const Icon(Icons.remove, color: Color(0xffFA7070)),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        )),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return BmiResultScreen(
                resultBmi: calculateBmi(),
              );
            })));
          },
          child: Container(
            decoration: BoxDecoration(color: secondaryColor),
            height: 50,
            margin: const EdgeInsets.all(10),
            child: const Center(
                child: Text('Calculate BMI',
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

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 4),
        decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: borderColor!)),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: thirdColor,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTextSTyle,
        )
      ],
    );
  }
}
