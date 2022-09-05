import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());
  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    if (event is ResetC) {
      yield* this._ResetC();
    } else if (event is AddNumber) {
      yield state.copyWith(
        mathResulth: (state.mathResulth == '0')
            ? event.num
            : state.mathResulth + event.num,
      );
    } else if (event is StartNegativeorPositive) {
      yield state.copyWith(
          mathResulth: state.mathResulth.contains("-")
              ? state.mathResulth.replaceFirst("-", "")
              : "-" + state.mathResulth);
    } else if (event is Porcent) {
      yield state.copyWith();
    } else if (event is Operations) {
      yield state.copyWith(
        num1: state.mathResulth,
        num2: "0",
        mathResulth: "0",
        ope: event.oper,
      );
    } else if (event is Result) {
      yield* _Result();
    }
  }

  Stream<CalculatorState> _ResetC() async* {
    yield CalculatorState(num1: '0', mathResulth: '0', num2: '0', ope: '');
  }

  Stream<CalculatorState> _Result() async* {
    double parsenum1 = double.parse(state.num1);
    double parsenum2 = double.parse(state.mathResulth);

    if (state.ope == "+") {
      yield state.copyWith(
          mathResulth: "${parsenum1 + parsenum2}", num2: state.mathResulth);
    } else if (state.ope == "-") {
      yield state.copyWith(
          mathResulth: "${parsenum1 - parsenum2}", num2: state.mathResulth);
    } else if (state.ope == "x") {
      yield state.copyWith(
          mathResulth: "${parsenum1 * parsenum2}", num2: state.mathResulth);
    } else if (state.ope == "/") {
      yield state.copyWith(
          mathResulth: "${parsenum1 / parsenum2}", num2: state.mathResulth);
    } else if (state.ope == "%") {
      yield state.copyWith(
          mathResulth: "${parsenum1 / 100}", num2: state.mathResulth);
    }
  }
}
