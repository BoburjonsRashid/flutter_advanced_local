import 'package:flutter/material.dart';

class EmployeeInfoPage extends StatefulWidget {
  static const String id = 'EmployeeInfoPage';
  final String name;
  const EmployeeInfoPage({super.key, required this.name});

  @override
  State<EmployeeInfoPage> createState() => _EmployeeInfoPageState();
}

class _EmployeeInfoPageState extends State<EmployeeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(widget.name),
        ),
      ),
    );
  }
}
