import 'package:flutter/material.dart';

import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [
        NavigationDrawerDestination(
          icon: Icon(Icons.add),
          label: const Text('Home Screen'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart),
          label: const Text('Otra pantalla'),
        ),
      ],
    );
  }
}
