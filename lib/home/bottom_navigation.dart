import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class BottomNavigationBarItems extends StatefulWidget {
  const BottomNavigationBarItems({super.key});

  @override
  State<BottomNavigationBarItems> createState() =>
      _BottomNavigationBarItemsState();
}

class _BottomNavigationBarItemsState extends State<BottomNavigationBarItems> {
  int _current = 2;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        currentIndex: _current,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: (val) async {
          setState(() {
            _current = val;
          });
          if (val == 4) {
             context.read<HomeBloc>().add(Logout());
            
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Visibility(visible: false, child: Icon(Icons.search)),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account')
        ]);
  }
}
