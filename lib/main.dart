import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientinfo/Utils/AuthService.dart';
import 'package:patientinfo/Views/Login.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Login(),
    );
  }
}
