import 'package:amazon_clone/core/providers/user_provider.dart';
import 'package:amazon_clone/core/ui.dart';
import 'package:amazon_clone/core/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices _authService = AuthServices();

  @override
  void initState() {
    super.initState();
    _authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone ',
      theme: ThemeData(
        scaffoldBackgroundColor: UI.backgroundColor,
        appBarTheme: const AppBarTheme().copyWith(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        colorScheme: const ColorScheme.light(
          primary: Colors.red,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: user.token.isNotEmpty
          ? user.userType != 'admin'
              ? const AdminScreen()
              : const BottomBar()
          : const AuthScreen(),
    );
  }
}
