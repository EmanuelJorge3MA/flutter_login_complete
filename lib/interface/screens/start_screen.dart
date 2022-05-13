import 'package:flutter/material.dart';
import 'package:flutter_template_v1/logic/logic.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCheckerCubit, InternetCheckerState>(
      listener: (context, state) {
        if (state is InternetCheckerConnected) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Internet'),
          ));
        }
        if (state is InternetCheckerDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('No internet'),
          ));
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
