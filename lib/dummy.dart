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

  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey.shade300),
                  //       borderRadius: BorderRadius.circular(7)),
                  //   padding: EdgeInsets.all(8),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.all(0),
                  //       border: InputBorder.none,
                  //       hintText: 'Sale for',
                  //       isDense: true,
                  //       label: Text('Sale for'),
                  //     ),
                  //   ),
                  // ),