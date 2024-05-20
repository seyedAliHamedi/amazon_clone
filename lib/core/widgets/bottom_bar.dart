import 'package:amazon_clone/core/ui.dart';
import 'package:amazon_clone/core/widgets/icon_with_badge.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarItemWidth = 42;
  double bottomBarItemBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text("Account Page")),
    const Center(child: Text("Cart Page")),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: UI.selectedNavBarColor,
        unselectedItemColor: UI.unselectedNavBarColor,
        backgroundColor: UI.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? UI.selectedNavBarColor
                        : UI.backgroundColor,
                    width: bottomBarItemBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? UI.selectedNavBarColor
                        : UI.backgroundColor,
                    width: bottomBarItemBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? UI.selectedNavBarColor
                        : UI.backgroundColor,
                    width: bottomBarItemBorderWidth,
                  ),
                ),
              ),
              child: const IconWithBadge(
                icon: Icon(Icons.shopping_bag_outlined),
                number: 5,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
