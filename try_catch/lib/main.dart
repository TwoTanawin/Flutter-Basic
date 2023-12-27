import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
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
  String operation = "";
  TextEditingController textFieldController1 = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();
  TextEditingController textFieldController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Operation: $operation',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOperationButton("+"),
                buildOperationButton("-"),
                buildOperationButton("*"),
                buildOperationButton("/"),
              ],
            ),
            SizedBox(height: 20),
            buildTextField('Input Number : 1', textFieldController1,
                fontSize: 20.0),
            SizedBox(height: 20),
            buildTextField('Input Number : 2', textFieldController2,
                fontSize: 20.0),
            SizedBox(height: 20),
            buildTextField('Result', textFieldController3, enabled: false),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOperationButton(String op) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          operation = op;
        });
      },
      child: Text(op),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool enabled = true, double fontSize = 16.0}) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: fontSize),
      ),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: fontSize),
    );
  }

  void calculate() {
    try {
      double num1 = double.tryParse(textFieldController1.text) ?? 0.0;
      double num2 = double.tryParse(textFieldController2.text) ?? 0.0;

      double result = 0.0;

      switch (operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            // Show popup for division by zero
            showDivisionByZeroPopup();
            return; // Exit the function to prevent setting the result in the TextField
          }
          break;
      }

      textFieldController3.text = result.toString();
    } catch (e) {
      // Handle other exceptions if needed
      textFieldController3.text = 'Error: $e';
    }
  }

  void showDivisionByZeroPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Division by zero is not allowed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
