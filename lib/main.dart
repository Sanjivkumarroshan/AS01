import 'package:AS01/src/bloc/authentication/authentication_bloc.dart';
import 'package:AS01/src/bloc/login/simple_bloc_delegate.dart';
import 'package:AS01/src/repository/user_repository.dart';
import 'package:AS01/src/ui/home_chart.dart';
import 'package:AS01/src/ui/home_screen.dart';
import 'package:AS01/src/ui/login/login_screen.dart';
import 'package:AS01/src/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primaryColor: Color(0xff543B7A),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            //return HomeScreen(name: state.displayName);
            return HomePage();
          }
          return SplashScreen();
        },
      ),
    );
  }
}
