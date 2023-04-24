import 'package:classified/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              SvgPicture.asset('assets/images/onboarding-1.svg',height: MediaQuery.of(context).size.height/3),
              const Text('Find your home in the UAE',style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff1C1E1D)),textAlign: TextAlign.center,textScaleFactor: 1.7,),
             const Text("Explore over 20,000 homes and find exactly what you're looking for with the help of 1000+ trusted agents .",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey),textAlign: TextAlign.center,textScaleFactor: 0.8,),
             const Spacer(),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> Login()));
                   
                },
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontWeight: FontWeight.w600),
                  textScaleFactor: 1.2,
                ),
              )
            ]),
      ),
    );
  }
}
