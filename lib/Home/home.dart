import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Text('Home page'),
        ),
      ),
    );
  }
}
