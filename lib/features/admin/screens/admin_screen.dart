import 'package:amazon_clone/core/ui.dart';
import 'package:amazon_clone/core/widgets/custom_appbar.dart';
import 'package:amazon_clone/features/admin/screens/product_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = '/admin-screen';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarItemWidth = 42;
  double bottomBarItemBorderWidth = 5;

  List<Widget> pages = [
    const ProductScreen(),
    const Center(child: Text("Analytics Page")),
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
          iconList: const [Text("Admin")],
        ),
      ),
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
              child: const Icon(Icons.analytics_outlined),
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
              child: const Icon(Icons.all_inbox_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
