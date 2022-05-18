import 'package:flutter/material.dart';

import '../../logic/logic.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            title: const Text('Login'),
          ),
          body: const Center(child: Text('Login Screen')),
        ));
  }
}
