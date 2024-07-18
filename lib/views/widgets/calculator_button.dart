
import 'package:calculator/utils/extentions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/colors.dart';
import '../../viewmodel/calculator_provider.dart';

class CalculatorButton extends ConsumerWidget {
  final String text;

  const CalculatorButton({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculatorNotifier = ref.watch(calculatorProvider.notifier);
    Color buttonColor = _getButtonColor(text);
    Color textColor = _getTextColor(text);
    double fontSize = _getFontSize(text);
    return Padding(
      padding: const EdgeInsets.all(3),
      child: InkWell(
        onTap: () {
          if (text == 'C') {
            calculatorNotifier.clearExpression();
          } else if (text == '=') {
            calculatorNotifier.evaluateExpression();
          } else if (text == 'DEL') {
            calculatorNotifier.deleteLastDigit();
          } else if (text == '+/-') {
            calculatorNotifier.toggleSign();
          } else if (text == '%') {
            calculatorNotifier.applyPercentage();
          } else if (text == '(') {
            calculatorNotifier.appendLeftParenthesis();
          } else if (text == ')') {
            calculatorNotifier.appendRightParenthesis();
          } else {
            if (text == 'x') {
              calculatorNotifier.appendExpression('*');
            } else {
              calculatorNotifier.appendExpression(text);
            }
          }
        },
        child: Container(
          height: 50.h,
          margin: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(text,
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontSize: fontSize, color: textColor)),
          ),
        ),
      ),
    );
  }

  Color _getButtonColor(String text) {
    switch (text) {
      case 'C' || 'DEL':
        return ColorManager.error;
      case '=':
        return ColorManager.green;

      default:
        return ColorManager.darkGrey;
    }
  }

  Color _getTextColor(String text) {
    switch (text) {
      case '+/-' || '%' || '+' || '-' || 'x' || '/':
        return ColorManager.blue;

      default:
        return ColorManager.white;
    }
  }

  double _getFontSize(String text) {
    switch (text) {
      case '=' || '+' || '-' || '.':
        return 30.sp;

      default:
        return 20.sp;
    }
  }
}