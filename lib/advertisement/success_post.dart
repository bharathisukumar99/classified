import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_bloc.dart';

class SuccessPost extends StatelessWidget {
  const SuccessPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3,),
                const Icon(
                  Icons.verified,
                  size: 100,
                  color: Colors.green,
                ),
               const Text(
                  'Successfully Posted Ad',
                  textScaleFactor: 1.5,
                ),
                Text(
                  state.title,
                  textScaleFactor: 1.5,
                ),
                Spacer(),
                FilledButton(onPressed: (){
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                }, child: Text('Explore')),
                Spacer(flex: 2,),
              ],
            ),
          );
        },
      ),
    );
  }
}
