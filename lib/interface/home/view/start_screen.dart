import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        /*BlocListener<InternetCheckerCubit, InternetCheckerState>(
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
    */
        Scaffold(
      appBar: AppBar(
        title: const Text('error'),
      ),
      body: const Center(child: Text('error')),
    );
  }
}
