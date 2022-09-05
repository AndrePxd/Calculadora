import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/calculator/calculator_bloc.dart';
import 'package:flutter_application_1/widgets/calc_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/calc_results.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
        ),
        body: Container(
          color: Colors.black,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                ResultsLabels(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: 'C',
                      btncolor: Colors.amber,
                      onPressed: () => calculatorBloc.add(ResetC()),
                    ),
                    CalculatorButton(
                      text: '+/-',
                      btncolor: Colors.amber,
                      onPressed: () =>
                          calculatorBloc.add(StartNegativeorPositive()),
                    ),
                    CalculatorButton(
                      text: '%',
                      btncolor: Colors.amber,
                      onPressed: () => calculatorBloc.add(Operations("%")),
                    ),
                    CalculatorButton(
                      text: '/',
                      btncolor: Colors.purple,
                      onPressed: () => calculatorBloc.add(Operations("/")),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '7',
                      onPressed: () => calculatorBloc.add(AddNumber('7')),
                    ),
                    CalculatorButton(
                      text: '8',
                      onPressed: () => calculatorBloc.add(AddNumber('8')),
                    ),
                    CalculatorButton(
                      text: '9',
                      onPressed: () => calculatorBloc.add(AddNumber('9')),
                    ),
                    CalculatorButton(
                      text: 'X',
                      btncolor: Colors.purple,
                      onPressed: () => calculatorBloc.add(Operations("x")),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '4',
                      onPressed: () => calculatorBloc.add(AddNumber('4')),
                    ),
                    CalculatorButton(
                      text: '5',
                      onPressed: () => calculatorBloc.add(AddNumber('5')),
                    ),
                    CalculatorButton(
                      text: '6',
                      onPressed: () => calculatorBloc.add(AddNumber('6')),
                    ),
                    CalculatorButton(
                      text: '-',
                      btncolor: Colors.purple,
                      onPressed: () => calculatorBloc.add(Operations("-")),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '1',
                      onPressed: () => calculatorBloc.add(AddNumber('1')),
                    ),
                    CalculatorButton(
                      text: '2',
                      onPressed: () => calculatorBloc.add(AddNumber('2')),
                    ),
                    CalculatorButton(
                      text: '3',
                      onPressed: () => calculatorBloc.add(AddNumber('3')),
                    ),
                    CalculatorButton(
                      text: '+',
                      btncolor: Colors.purple,
                      onPressed: () => calculatorBloc.add(Operations("+")),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '0',
                      big: true,
                      onPressed: () => calculatorBloc.add(AddNumber('0')),
                    ),
                    CalculatorButton(
                      text: '.',
                      onPressed: () => calculatorBloc.add(AddNumber('.')),
                    ),
                    CalculatorButton(
                      text: '=',
                      btncolor: Colors.purple,
                      onPressed: () => calculatorBloc.add(Result()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
