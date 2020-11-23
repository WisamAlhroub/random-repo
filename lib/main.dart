import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_before_exam/provider.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        home: Login(),
      ),
    );
  }
}
