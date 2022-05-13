import 'package:flutter/material.dart';
import 'package:flutter_template_v1/logic/logic.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'bloc_observer.dart';
import 'interface/router/app_router.dart';

// void main() {
//   runApp(MyApp());
// }

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      runApp(MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCheckerCubit>(
          create: (context) => InternetCheckerCubit(
              internetConnectionChecker: internetConnectionChecker),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
