import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Icon icon;
  const MyIconButton({super.key, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: 50,
    );
  }
}
