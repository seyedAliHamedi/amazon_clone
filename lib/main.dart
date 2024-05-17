import 'package:amazon_clone/core/ui.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: const AuthScreen(),
    );
  }
}
