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
        title: const Text(
          'BMI Weight Tracker',
          style: TextStyle(color: Color(0xffFA7070)),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          children: const [
            Expanded(
                child: BmiCard(
              child: GenderIconText(title: 'MALE', icon: Icons.male),
            )),
            Expanded(
              child: BmiCard(
                  child: GenderIconText(title: 'FEMALE', icon: Icons.female)),
            )
          ],
        )),
        Expanded(
            child: BmiCard(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              thumbColor: Color(0xffFA7070),
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
                        // elevation: 0,
                        child: const Icon(
                          Icons.add,
                          color: Color(0xffFA7070),
                        ),
                        shape: const CircleBorder(),
                        fillColor: primaryColor,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          weight--;
                          setState(() {});
                        },
                        // elevation: 0,
                        child:
                            const Icon(Icons.remove, color: Color(0xffFA7070)),
                        shape: const CircleBorder(),
                        fillColor: primaryColor,
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
                  const SizedBox(
                    height: 10,
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          age++;
                          setState(() {});
                        },
                        // elevation: 0,
                        // ignore: sort_child_properties_last
                        child: const Icon(
                          Icons.add,
                          color: Color(0xffFA7070),
                        ),
                        shape: const CircleBorder(),
                        fillColor: primaryColor,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          age--;
                          setState(() {});
                        },
                        // elevation: 0,
                        // ignore: sort_child_properties_last
                        child: const Icon(
                          Icons.remove,
                          color: Color(0xffFA7070),
                        ),
                        shape: const CircleBorder(),
                        fillColor: primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ))
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
            height: 60,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(9),
        height: 200,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
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
