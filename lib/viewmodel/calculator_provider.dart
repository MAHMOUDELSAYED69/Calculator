import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/calculator_model.dart';
import 'package:expressions/expressions.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorViewModel, CalculatorModel>(
  (ref) => CalculatorViewModel(),
);

class CalculatorViewModel extends StateNotifier<CalculatorModel> {
  CalculatorViewModel() : super(CalculatorModel());

  void appendExpression(String value) {
    state = state.copyWith(expression: state.expression + value);
  }

  void clearExpression() {
    state = state.copyWith(expression: '', result: '');
  }

  void deleteLastDigit() {
    if (state.expression.isNotEmpty) {
      state = state.copyWith(
          expression:
              state.expression.substring(0, state.expression.length - 1));
    }
  }

  void toggleSign() {
    if (state.expression.isNotEmpty) {
      if (state.expression.startsWith('-')) {
        state = state.copyWith(expression: state.expression.substring(1));
      } else {
        state = state.copyWith(expression: '-${state.expression}');
      }
    }
  }

  void applyPercentage() {
    if (state.expression.isNotEmpty) {
      try {
        final value = double.parse(state.expression);
        final percentage = value / 100;
        state = state.copyWith(expression: percentage.toString());
      } catch (e) {
        state = state.copyWith(result: 'Error');
      }
    }
  }


  void evaluateExpression() {
    try {
      final expression = Expression.parse(state.expression);
      const evaluator = ExpressionEvaluator();
      final result = evaluator.eval(expression, {}).toString();
      final doubleResult = num.parse(result);
      final formattedResult =
          (doubleResult.abs() > 1e6 || doubleResult.abs() < 1e-6)
              ? doubleResult.toStringAsExponential(6)
              : doubleResult.toString();
      state = state.copyWith(result: formattedResult);
    } catch (e) {
      state = state.copyWith(result: 'Error');
    }
  }

  void appendLeftParenthesis() {
    state = state.copyWith(expression: '${state.expression}(');
  }

  void appendRightParenthesis() {
    state = state.copyWith(expression: '${state.expression})');
  }

  void copyText() {
    if (state.result.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: state.result));
      log('copy');
    }
  }
}
