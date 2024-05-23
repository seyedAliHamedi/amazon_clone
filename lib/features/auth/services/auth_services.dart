// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_clone/core/error_handling.dart';
import 'package:amazon_clone/core/providers/user_provider.dart';
import 'package:amazon_clone/core/utils.dart';
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
                'x-auth-token', jsonDecode(response.body)['token']);
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");
      if (token == null) {
        prefs.setString("x-auth-token", '');
      }
      http.Response toeknResponse = await http.post(
        Uri.parse("http://127.0.0.1:8000/auth/validate-token"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'x-auth-header': token!,
        },
      );
      var response = jsonDecode(toeknResponse.body);
      if (response) {
        http.Response userRespone = await http.get(
          Uri.parse("http://127.0.0.1:8000/authenticate"),
          headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8",
            'x-auth-header': token,
          },
        );
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRespone.body);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
