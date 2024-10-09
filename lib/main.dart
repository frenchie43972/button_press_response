import 'package:button_press_response/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonPressResponse());
}

class ButtonPressResponse extends StatelessWidget {
  const ButtonPressResponse({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Button Press Response App',
      home: HomeScreen(),
    );
  }
}
