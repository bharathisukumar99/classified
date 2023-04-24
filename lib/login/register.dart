import 'package:classified/login/email_password.dart';
import 'package:classified/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/login_methods.dart';

class Register extends StatelessWidget {
  const Register({super.key});
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
              onPressed: () {},
              icon: Icon(
                Icons.close,
                color: Colors.grey[350],
              ),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset('assets/images/welcome.svg', height: MediaQuery.of(context).size.height/5),
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
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 12),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    SvgPicture.asset('assets/images/facebook.svg', height: 24),
                label: Text('Continue with Facebook'),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: () async {
                  await signInWithGoogle();
                },
                icon: SvgPicture.asset('assets/images/google.svg',
                    color: Theme.of(context).colorScheme.primary, height: 24),
                label: Text('Continue with Google'),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: () {},
                icon: SvgPicture.asset('assets/images/apple.svg', height: 24),
                label: Text('Continue with Apple'),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  EmailPasswordPage('R')),
                  );
                },
                icon: Icon(Icons.mail),
                label: Text('Continue with Email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Login()),
                  );
                },
                child: const Text(
                  "Already a User? Log In",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
