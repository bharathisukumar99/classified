import 'package:classified/constant_widgets.dart';
import 'package:classified/login/bloc/login_bloc.dart';
import 'package:classified/login/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';
import '../home/main_page.dart';

class EmailPasswordPage extends StatelessWidget {
  EmailPasswordPage({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 52,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
               Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.grey[350],
            ),
          ),
        ],
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.responseCode == 200) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(onSuccess('Successfully Register'));
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const MainPage()),
                          );
                        }
                        if (state.responseCode == 400) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              onError('The password provided is too weak.'));
                        }
                        if (state.responseCode == 402) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              onError('Something went wrong, Try again Later!'));
                        }
                        if (state.responseCode == 401) {
                          ScaffoldMessenger.of(context).showSnackBar(onError(
                              'The account already exists for that email.'));
                        }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/register.svg',
                      height: MediaQuery.of(context).size.height / 4),
                  Text(
                    'Register',
                    textScaleFactor: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                      prefixIconColor: Theme.of(context).colorScheme.primary,
                      prefixIcon: Icon(
                        Icons.mail,
                      ),
                      border: OutlineInputBorder(),
                      isDense: true,
                      hintText: 'Enter your email',
                      label: Text('Email'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: Theme.of(context).colorScheme.primary,
                      border: OutlineInputBorder(),
                      isDense: true,
                      hintText: 'Enter your password',
                      label: Text('Password'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<LoginBloc>().add(RegisterEvent(
                            username: username.text, password: password.text));
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: const Text(
                        "Register",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                      visible: state.status == FetchStatus.initial,
                      child: CircularProgressIndicator())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
