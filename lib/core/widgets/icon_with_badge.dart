import 'package:flutter/material.dart';

class IconWithBadge extends StatelessWidget {
  final Icon icon;
  final int number;
  const IconWithBadge({
    super.key,
    required this.icon,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: icon,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
