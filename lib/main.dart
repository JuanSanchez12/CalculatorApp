import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _CalculatorApp();
}

class _CalculatorApp extends State<MyHomePage> {
  String displayText = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
      displayText = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
      } 
      else if (value == "=") {
      displayText = "0";
      } 
      else {
        if (displayText == "0") {
        displayText = value;
        } 
        else {
        displayText += value;
        }
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(16),
            child: Text(
              displayText,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          const Spacer(),
          Align(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                CalculatorButton(label: "7", onTap: () => onButtonPressed("7")),
                CalculatorButton(label: "8", onTap: () => onButtonPressed("8")),
                CalculatorButton(label: "9", onTap: () => onButtonPressed("9")),
                CalculatorButton(label: "/", onTap: () => onButtonPressed("/")),
                CalculatorButton(label: "4", onTap: () => onButtonPressed("4")),
                CalculatorButton(label: "5", onTap: () => onButtonPressed("5")),
                CalculatorButton(label: "6", onTap: () => onButtonPressed("6")),
                CalculatorButton(label: "*", onTap: () => onButtonPressed("*")),
                CalculatorButton(label: "1", onTap: () => onButtonPressed("1")),
                CalculatorButton(label: "2", onTap: () => onButtonPressed("2")),
                CalculatorButton(label: "3", onTap: () => onButtonPressed("3")),
                CalculatorButton(label: "-", onTap: () => onButtonPressed("-")),
                CalculatorButton(label: "0", onTap: () => onButtonPressed("0")),
                CalculatorButton(label: "C", onTap: () => onButtonPressed("C")),
                CalculatorButton(label: "=", onTap: () => onButtonPressed("=")),
                CalculatorButton(label: "+", onTap: () => onButtonPressed("+")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CalculatorButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.blueGrey[800],
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
