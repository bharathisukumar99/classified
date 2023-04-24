import 'package:flutter/material.dart';
 
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Placeholder());
  }
}


  // Color circleColor(int index) {
  //   final ColorScheme colorScheme = Theme.of(context).colorScheme;
  //   if (!_isDark()) {
  //     return widget.steps[index].isActive ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.38);
  //   } else {
  //     return widget.steps[index].isActive ? colorScheme.secondary : colorScheme.background;
  //   }
  // }