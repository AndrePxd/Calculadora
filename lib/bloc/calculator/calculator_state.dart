part of 'calculator_bloc.dart';

class CalculatorState {
  final String mathResulth;
  final String num1;
  final String num2;
  final String ope;

  CalculatorState(
      {this.mathResulth = '45',
      this.num1 = '30',
      this.num2 = '15',
      this.ope = '+'});

  CalculatorState copyWith({
    String? mathResulth,
    String? num1,
    String? num2,
    String? ope,
  }) =>
      CalculatorState(
        mathResulth: mathResulth ?? this.mathResulth,
        num1: num1 ?? this.num1,
        num2: num2 ?? this.num2,
        ope: ope ?? this.ope,
      );
}




//class CalculatorInitial extends CalculatorState {}
