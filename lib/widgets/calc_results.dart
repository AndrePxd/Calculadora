import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/calculator/calculator_bloc.dart';
import 'sub_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'line_separator.dart';
import 'main_result.dart';

class ResultsLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: SubResult(text: state.num1)),
            Expanded(child: SubResult(text: state.ope)),
            Expanded(child: SubResult(text: state.num2)),
            Expanded(child: LineSeparator()),
            Expanded(child: SubResult(text: state.mathResulth))
            /*    SubResult(text: state.num1),
            SubResult(text: state.ope),
            SubResult(text: state.num2),
            LineSeparator(),
            MainResultText(text: state.mathResulth),*/
          ],
        );
      },
    );
  }
}
