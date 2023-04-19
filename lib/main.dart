import 'package:classified/login/Register.dart';
import 'package:classified/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_schemes.g.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'home/main_page.dart';
import 'login/bloc/login_bloc.dart';
import 'login/email_password.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Classified App',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            fontFamily: 'Raleway'),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/email': (context) => EmailPasswordPage(),
          '/home': (context) => const MainPage(),
        },
         
      ),
    );
  }
}
