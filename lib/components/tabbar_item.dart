import 'package:flutter/material.dart';

class TabBarItem extends BottomNavigationBarItem {
  TabBarItem(IconData icon, String title)
      : super(
          icon: Icon(icon),
          title: Text(title),
        );
}
