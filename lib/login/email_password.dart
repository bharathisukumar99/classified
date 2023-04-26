import 'package:classified/constant_widgets.dart';
import 'package:classified/login/bloc/login_bloc.dart';
import 'package:classified/login/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';
import '../home.dart';
import '../home/home.dart';
import '../home/main_page.dart';

class EmailPasswordPage extends StatelessWidget {
  String arguments;
  EmailPasswordPage(this.arguments);
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
               FocusManager.instance.primaryFocus?.unfocus();
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const MainPage()),
                          );
                        }
                        if (state.responseCode == 400) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              onError(arguments == 'R' ? 'The password provided is too weak.' : "No user found for that email."));
                        }
                        if (state.responseCode == 402) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              onError(arguments == 'R' ? 'Something went wrong, Try again Later!' : 'Invalid Login'));
                        }
                        if (state.responseCode == 401) {
                          ScaffoldMessenger.of(context).showSnackBar(onError(
                              arguments == 'R' ? 'The account already exists for that email.' :"Wrong password provided for that user."));
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
                    arguments == 'L' ? 'Login' :'Register' ,
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
                        if(username.text.isNotEmpty && password.text.isNotEmpty){
arguments == 'R' ?
                        context.read<LoginBloc>().add(RegisterEvent(
                            username: username.text, password: password.text)) : context.read<LoginBloc>().add(LoginInitiateEvent(
                            username: username.text, password: password.text));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(onError('Please Fill Email and Password'));
                        }
                        
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Text(
                        arguments == 'L' ? 'Login' :'Register' ,
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
