import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_v1/constants/enum.dart';
import 'package:flutter_template_v1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_template_v1/logic/logic.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'bloc_observer.dart';
import 'firebase_options.dart';
import 'interface/router/app_router.dart';
import 'interface/screens/screens.dart';

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

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;
  final InternetConnectionChecker _internetConnectionChecker;

  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required InternetConnectionChecker internetConnectionChecker,
  })  : _authenticationRepository = authenticationRepository,
        _internetConnectionChecker = internetConnectionChecker,
        super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) =>
                AppBloc(authenticationRepository: _authenticationRepository),
          ),
          BlocProvider<InternetCheckerCubit>(
            create: (context) => InternetCheckerCubit(
                internetConnectionChecker: _internetConnectionChecker),
          ),
        ],
        //child: L2(widget: LoginScreen()),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state.status == AppStatus.authenticated) {
              return L1();
            }
            if (state.status == AppStatus.unauthenticated) {
              return const L2(
                widget: LoginScreen(),
              );
            }
            return const L2(
              widget: StartScreen(),
            );
          },
        ),
      ),
    );
  }
}

class L1 extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  L1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

class L2 extends StatelessWidget {
  final Widget widget;
  const L2({Key? key, required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: widget,
    );
  }
}
