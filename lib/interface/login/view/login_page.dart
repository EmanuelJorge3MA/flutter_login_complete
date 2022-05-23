import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_v1/interface/login/view/login_form.dart';

import '../../../package/authentication/authentication_repository.dart';
import '../../../package/internetChecker/internet_checker.dart';
import '../cubit/login_cubit.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocProvider(
            create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
