import 'package:amazon_clone/core/utils.dart';
import 'package:amazon_clone/core/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/add_product_modal.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const HomeScreen(),
      );
    case AdminScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AdminScreen(),
      );
    case AddProductModal.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AddProductModal(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => notFoundScreen(),
      );
  }
}
