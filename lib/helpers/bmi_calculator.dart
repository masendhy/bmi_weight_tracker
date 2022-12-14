// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_weight_tracker/constant/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? resultBmi;
  String? bmiCategory;
  String? bmiDesc;

  BmiCalculator({
    required this.height,
    required this.weight,
  });

  BmiCalculator.fromBmiValue(this.resultBmi);

  double calculateBmi() {
    double heightInMeter = height! / 100;

    final h = (heightInMeter * heightInMeter);
    resultBmi = weight! / h;
    return resultBmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (resultBmi! < 18.5) {
      category = underweight;
    } else if (resultBmi! < 25) {
      category = healthyweight;
    } else if (resultBmi! < 30) {
      category = preobesity;
    } else if (resultBmi! >= 30) {
      category = obesity;
    }
    bmiCategory = category;
    return bmiCategory!;
  }

  String getRiskDescription() {
    String desc = "";

    switch (bmiCategory) {
      case underweight:
        desc =
            'A BMI score of less than 18.5 indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice ';

        break;
      case healthyweight:
        desc =
            'Your BMI indicates that you are at a healty weight for your height. By maintaining a healty weight, you lower your risk of developng seriously health problems';
        break;
      case preobesity:
        desc =
            'A BMI score of 25 - 29.9 indicates that you are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or dietitian for advice.';
        break;
      case obesity:
        desc =
            'A BMI score of over 30 indicates that you are heavily overweight. Your health may be at risk if you do not lose weight. ou are recommended to talk to your doctor or dietitian for advice';

        break;
    }
    bmiDesc = desc;
    return desc;
  }
}
