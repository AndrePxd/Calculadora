import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());
  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {}
}
