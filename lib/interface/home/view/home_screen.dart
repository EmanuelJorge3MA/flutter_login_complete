import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_v1/app/app.dart';

import '../../../package/internetChecker/internet_checker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              user.email ?? '',
              style: textTheme.headline6,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.name ?? '',
              style: textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
