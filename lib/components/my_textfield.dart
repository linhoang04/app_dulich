import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final String hinText;
  final TextEditingController controller;
  final bool obscureText;
  final Function(String)? onChanged;
  const MyTextField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.obscureText,
    required this.hinText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hinText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
