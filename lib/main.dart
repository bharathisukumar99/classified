import 'package:classified/advertisement/post_ad_page.dart';
import 'package:classified/login/Register.dart';
import 'package:classified/login/login.dart';
import 'package:classified/login/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'advertisement/bloc/post_bloc.dart';
import 'advertisement/field_information.dart';
import 'color_schemes.g.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'home/bloc/home_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => PostBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
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
          '/board':(context) => const Onboarding(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/email': (context) => EmailPasswordPage('N'),
          '/home': (context) => const MainPage(),
          '/post': (context) => const PostAdPage(),
          '/field': (context) => const FieldInformation(),
        },
      ),
    );
  }
}
