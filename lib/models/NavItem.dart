import 'package:flutter/material.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget destination;

  NavItem({required this.id, required this.icon, required this.destination});

  // if there is no destination this will help.
  bool destinationCheck() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}
