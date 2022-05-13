import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start'),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).pushNamed('/homescreen');
          },
          child: const Text('Start'),
        ),
      ),
    );
  }
}
