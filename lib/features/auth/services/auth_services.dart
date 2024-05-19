// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_clone/core/common/show_snackbar.dart';
import 'package:amazon_clone/core/error_handling.dart';
import 'package:amazon_clone/core/providers/user_provider.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          userType: '',
          token: '');
      http.Response response = await http.post(
          Uri.parse("http://127.0.0.1:8000/auth/signup"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8"
          });
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () => showSnackBar(context,
              "Account created; please log in with the same credintals"));
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void singIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      String body = jsonEncode({
        "email": email,
        "password": password,
      });
      http.Response response = await http.post(
          Uri.parse("http://127.0.0.1:8000/auth/signin"),
          body: body,
          headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8"
          });
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                'x-auth-key', jsonDecode(response.body)['token']);
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
