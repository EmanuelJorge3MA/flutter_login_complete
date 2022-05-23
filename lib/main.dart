import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_v1/app/view/app_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'app/bloc_observer.dart';
import 'firebase_options.dart';
import 'package/authentication/authentication_repository.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authenticationRepository = AuthenticationRepository();
      final internetConnectionChecker = InternetConnectionChecker();
      //await authenticationRepository.user.first;
      runApp(App(
        authenticationRepository: authenticationRepository,
        internetConnectionChecker: internetConnectionChecker,
      ));
    },
    blocObserver: AppBlocObserver(),
  );
}
