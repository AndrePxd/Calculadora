part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ResetC extends CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String num;
  AddNumber(this.num);
}
