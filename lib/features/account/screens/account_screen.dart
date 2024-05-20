import 'package:amazon_clone/core/ui.dart';
import 'package:amazon_clone/features/account/widgets/below_appbar.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account-screen';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: UI.appBarGradient,
            ),
          ),
          title: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/amazon_in.png",
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: const Row(
                  children: [
                    Icon(Icons.notifications_outlined),
                    SizedBox(width: 15),
                    Icon(Icons.search)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 20),
          TopButtons(),
          SizedBox(height: 20),
          Orders(),
        ],
      ),
    );
  }
}
