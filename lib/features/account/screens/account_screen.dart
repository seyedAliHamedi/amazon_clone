import 'package:amazon_clone/core/widgets/custom_appbar.dart';
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
        child: CustomAppBar(
          titleWidget: Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/images/amazon_in.png",
              width: 120,
              height: 45,
              color: Colors.black,
            ),
          ),
          iconList: const [
            Icon(Icons.notifications_outlined),
            SizedBox(width: 15),
            Icon(Icons.search)
          ],
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
