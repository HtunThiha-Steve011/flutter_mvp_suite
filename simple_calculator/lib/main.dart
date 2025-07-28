import 'package:flutter/material.dart';
import 'package:simple_calculator/utils/calculator_functions.dart';

void main() => runApp(IndexWidget());

class IndexWidget extends StatelessWidget {
  const IndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SimpleCalculatorWidget()
      ),
    );
  }
}

class SimpleCalculatorWidget extends StatefulWidget {
  const SimpleCalculatorWidget({super.key});

  @override
  State<SimpleCalculatorWidget> createState() => _SimpleCalculatorWidgetState();
}

class _SimpleCalculatorWidgetState extends State<SimpleCalculatorWidget> {
  String _previousCalculationExpression = '5+5=';
  String _displayExpression = '25';
  final List<String> mathOperationChars = ['+', '-', '×', '÷', '%'];
  final List<num> numInputs = [];
  final List<double Function(num, num)> operationInputs = [];
  bool lastInputIsNum = false;
  bool isEmptyExpression = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _previousCalculationExpression,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey
                  )
                )
              ]
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _displayExpression,
                style: TextStyle(
                  fontSize: 50
                )
              )
            ]
          ),
          SizedBox(height: 20),
          CalculatorButtonsRow(
            firstBtnChild: Text('AC', style: TextStyle(fontSize: 25)),
            secondBtnChild: Text('+/-', style: TextStyle(fontSize: 25)),
            thirdBtnChild: Text('%', style: TextStyle(fontSize: 25)),
            fourthBtnChild: Text('÷', style: TextStyle(fontSize: 25))
          ),
          SizedBox(height: 20),
          CalculatorButtonsRow(
            firstBtnChild: Text('7', style: TextStyle(fontSize: 25)),
            secondBtnChild: Text('8', style: TextStyle(fontSize: 25)),
            thirdBtnChild: Text('9', style: TextStyle(fontSize: 25)),
            fourthBtnChild: Text('x', style: TextStyle(fontSize: 25))
          ),
          SizedBox(height: 20),
          CalculatorButtonsRow(
            firstBtnChild: Text('4', style: TextStyle(fontSize: 25)),
            secondBtnChild: Text('5', style: TextStyle(fontSize: 25)),
            thirdBtnChild: Text('6', style: TextStyle(fontSize: 25)),
            fourthBtnChild: Text('-', style: TextStyle(fontSize: 25))
          ),
          SizedBox(height: 20),
          CalculatorButtonsRow(
            firstBtnChild: Text('1', style: TextStyle(fontSize: 25)),
            secondBtnChild: Text('2', style: TextStyle(fontSize: 25)),
            thirdBtnChild: Text('3', style: TextStyle(fontSize: 25)),
            fourthBtnChild: Text('+', style: TextStyle(fontSize: 25))
          ),
          SizedBox(height: 20),
          CalculatorButtonsRow(
            firstBtnChild: Icon(Icons.history, size: 30),
            secondBtnChild: Text('0', style: TextStyle(fontSize: 25)),
            thirdBtnChild: Text('.', style: TextStyle(fontSize: 25)),
            fourthBtnChild: Text('=', style: TextStyle(fontSize: 25))
          )
        ]
      )
    );
  }
}

class CalculatorButtonsRow extends StatelessWidget {
  final Widget firstBtnChild;
  final Widget secondBtnChild;
  final Widget thirdBtnChild;
  final Widget fourthBtnChild;

  const CalculatorButtonsRow({
    super.key,
    required this.firstBtnChild,
    required this.secondBtnChild,
    required this.thirdBtnChild,
    required this.fourthBtnChild
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CalculatorButton(btnChild: firstBtnChild, onPressed: () {}),
        Spacer(),
        CalculatorButton(btnChild: secondBtnChild, onPressed: () {}),
        Spacer(),
        CalculatorButton(btnChild: thirdBtnChild, onPressed: () {}),
        Spacer(),
        CalculatorButton(btnChild: fourthBtnChild, onPressed: () {})
      ]
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final Widget btnChild;
  final void Function() onPressed;

  const CalculatorButton({
    super.key,
    required this.btnChild,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsetsGeometry.zero),
        fixedSize: WidgetStatePropertyAll(Size(70, 70))
      ),
      onPressed: onPressed,
      child: btnChild
    );
  }
}