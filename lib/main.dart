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
      theme: ThemeData.dark(), // Sets the theme to dark mode
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

// State class for the calculator functionality
class _CalculatorApp extends State<MyHomePage> {
  String displayText = "0"; // Initial display text on the calculator
  double num1 = 0; // First number in the calculation
  double num2 = 0; // Second number in the calculation
  String operand = ""; // Operand for the calculation (+, -, *, /)

  // Handles the logic when a button is pressed.
  void onButtonPressed(String value) {
    setState(() {
      // Clears the display and resets values when "C" is pressed
      if (value == "C") {
        displayText = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      } 
      // Perform the calculation when "=" is pressed
      else if (value == "=") {
        if (operand.isNotEmpty) {
          switch (operand) {
            case "+":
              displayText = (num1 + num2).toString();
              break;
            case "-":
              displayText = (num1 - num2).toString();
              break;
            case "*":
              displayText = (num1 * num2).toString();
              break;
            case "/":
              displayText = (num1 / num2).toString();
              break;
          }
        }
      }
      // Set the operand and prepare for the second number
      else if (["+", "-", "*", "/"].contains(value)) {
        num1 = double.parse(displayText);
        operand = value;
        displayText = "0"; // Reset display for the second number input
      } 
      // For number input or when the operand has already been set
      else {
        if (operand.isNotEmpty) {
          if (displayText == "0") {
            displayText = value;
          } 
          else {
            displayText += value; // Append value to the display
          }
          num2 = double.parse(displayText); // Store the second number
        } 
        else {
          if (displayText == "0") {
            displayText = value;
          } 
          else {
            displayText += value; // Append value to the display
          }
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
          // Container for displaying the current text in the calculator
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(16),
            child: Text(
              displayText, // Display the current value
              style: TextStyle(
                fontSize: 48, // Font size for the display
                fontWeight: FontWeight.bold, // Bold font for the display
              ),
              textAlign: TextAlign.end, // Align the text to the right
            ),
          ),
          const Spacer(),
          // The grid layout for the calculator buttons
          Align(
            child: GridView.count(
              shrinkWrap: true, // Makes the grid view take only the space it needs
              crossAxisCount: 4, // Number of buttons per row
              children: [
                // Create buttons with their respective labels and onTap handlers
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

// A custom button widget for the calculator
class CalculatorButton extends StatelessWidget {
  final String label; // The label for the button
  final VoidCallback onTap; // The function to call when the button is pressed

  const CalculatorButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Padding around the button
      child: SizedBox(
        width: 70, // Set the width of the button
        height: 70, // Set the height of the button
        child: ElevatedButton(
          onPressed: onTap, // Trigger the onTap function when the button is pressed
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded corners for the button
            padding: const EdgeInsets.all(20), // Padding inside the button
            backgroundColor: Colors.blueGrey[800], // Button background color
          ),
          child: Text(
            label, // The text to display on the button
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Text style
          ),
        ),
      ),
    );
  }
}
