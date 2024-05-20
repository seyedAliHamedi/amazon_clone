import 'package:amazon_clone/core/providers/user_provider.dart';
import 'package:amazon_clone/core/ui.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(gradient: UI.appBarGradient),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      width: double.infinity,
      child: RichText(
        text: TextSpan(
          text: "Hello, ",
          style: const TextStyle(fontSize: 22, color: Colors.black),
          children: [
            TextSpan(
              text: user.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
