import 'package:flutter/material.dart';
import 'package:stupidhome/screens/control_center_screen.dart';

void main() {
  runApp(StupidHome());
}

class StupidHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stupid Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ControlCenterScreen(),
    );
  }
}