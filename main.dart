import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cute Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';


  void addToInput(String value) {
    setState(() {
      input += value;
    });
  }

  void clearInput() {
    setState(() {
      input = '';
    });
  }

  void calculateResult() {
    setState(() {
      //input = eval(input).toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Cute Calc Demo App"),
            ],
          ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              input,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('1', color: Colors.blue), 
              buildButton('2', color: Colors.blue),
              buildButton('3', color: Colors.blue),
              buildButton('+', color: Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('4', color: Colors.blue),
              buildButton('5', color: Colors.blue),
              buildButton('6', color: Colors.blue),
              buildButton('-', color: Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('7', color: Colors.blue),
              buildButton('8', color: Colors.blue),
              buildButton('9', color: Colors.blue),
              buildButton('*', color: Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('0', color: Colors.blue),
              buildButton('C', color: Colors.red),
              buildButton('=', color: Colors.green),
              buildButton('/', color: Colors.blue),
            ],
          ),
        ],
        ),

    );

    
  }

  Widget buildButton(String label, {required Color color}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: MaterialButton(
          color: color ?? Colors.grey[200],
          child: Text(
            label,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            if (label == 'C') {
              clearInput();
            } else if (label == '=') {
              calculateResult();
            } else {
              addToInput(label);
            }
          },
        ),
      ),
    );
  }
}


