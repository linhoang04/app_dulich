import 'package:flutter/material.dart';

class MyCountryTitle extends StatelessWidget {
  final String code;
  final Function()? onTap;
  final Function()? onPressed;
  final String nameCountry;
  final String nameCiti;
  const MyCountryTitle({
    super.key,
    this.onTap,
    required this.code,
    required this.nameCountry,
    required this.nameCiti,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin:
                const EdgeInsets.only(top: 5, bottom: 5, left: 25, right: 3),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                //icon
                Image.network(
                  "https://flagcdn.com/32x24/${code.toLowerCase()}.png",
                ),
                const SizedBox(
                  width: 20,
                ),
                //username
                Expanded(
                  child: Text(
                    "$nameCountry/$nameCiti",
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
