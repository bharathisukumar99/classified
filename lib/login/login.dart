import 'package:flutter/material.dart';

import 'Register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              Text(
                'Log In',
                textScaleFactor: 3,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                height: 40,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color:Theme.of(context).colorScheme.primary,width: 12 ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.face),
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
                onPressed: () {},
                icon: Icon(Icons.face),
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
                icon: Icon(Icons.face),
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
                onPressed: () {},
                icon: Icon(Icons.face),
                label: Text('Continue with Email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
               
                onPressed: () {
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const Register()),
  );
                },
                child: const Text(
                  "Don't have an account? Create one",
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
