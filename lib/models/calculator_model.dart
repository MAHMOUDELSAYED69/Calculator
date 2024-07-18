class CalculatorModel {
  final String expression;
  final String result;

  CalculatorModel({this.expression = '', this.result = ''});

  CalculatorModel copyWith({String? expression, String? result}) {
    return CalculatorModel(
      expression: expression ?? this.expression,
      result: result ?? this.result,
    );
  }
}
