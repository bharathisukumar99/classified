import 'package:flutter/material.dart';

SnackBar onError(String s) => SnackBar(content: Text(s),backgroundColor: Colors.red.shade800,behavior: SnackBarBehavior.floating,);

SnackBar onSuccess(String s) => SnackBar(content: Text(s),backgroundColor: Colors.green.shade800,behavior: SnackBarBehavior.floating,);

Color primary(BuildContext context) => Theme.of(context).colorScheme.primary;
Color onPrimaryContainer(BuildContext context) => Theme.of(context).colorScheme.onPrimaryContainer;
double height(BuildContext context) => MediaQuery.of(context).size.height;