import 'package:amazon_clone/core/ui.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget titleWidget;
  final List<Widget> iconList;
  const CustomAppBar({
    super.key,
    required this.titleWidget,
    required this.iconList,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: UI.appBarGradient,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleWidget,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(children: iconList),
          )
        ],
      ),
    );
  }
}
