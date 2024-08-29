import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Demo Scroll")),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(50, (index) => ListTile(
              title: Text('Item $index'),
            )),
          ),
        ),
      ),
    );
  }
}