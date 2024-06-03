import 'package:flutter/material.dart';
import 'home_screen.dart';

void navigateToCart(BuildContext context) {
  final HomeScreenState? state = context.findAncestorStateOfType<HomeScreenState>();
  state?.navigateToCart();
}
