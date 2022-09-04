import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());
  // Stream<String> retornaString() async* {
  //   yield 'Hola Mundo';
  // }

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is ResetC) {
      yield CalculatorState(
          num1: '0', mathResulth: '0', num2: '0', ope: 'none');
    } else if (event is AddNumber) {
      yield CalculatorState(
        num1: '0',
        num2: '0',
        ope: 'none',
        mathResulth: (state.mathResulth == '0')
            ? event.num
            : state.mathResulth + event.num,
      );
    }
  }
}
