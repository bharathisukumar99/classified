import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background.withOpacity(0.6),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: const [
            SizedBox(
                height: 52,
                width: 52,
                child: RotatedBox(
                    quarterTurns: 0, child: CircularProgressIndicator())),
            SizedBox(
                height: 42,
                width: 42,
                child: RotatedBox(
                    quarterTurns: 1, child: CircularProgressIndicator())),
            SizedBox(
                height: 32,
                width: 32,
                child: RotatedBox(
                    quarterTurns: 2, child: CircularProgressIndicator())),
            SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  value: 1,
                )),
          ],
        ),
      ),
    );
  }
}
