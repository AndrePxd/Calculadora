part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ResetC extends CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String num;
  AddNumber(this.num);
}

class StartNegativeorPositive extends CalculatorEvent {}

class Porcent extends CalculatorEvent {}

class Operations extends CalculatorEvent {
  final String oper;
  Operations(this.oper);
}

class Result extends CalculatorEvent {}
