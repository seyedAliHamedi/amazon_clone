// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_clone/core/error_handling.dart';
import 'package:amazon_clone/core/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeServices {
  Future<List<Product>> fetchCategoryProducts(
      {required BuildContext context, required String category}) async {
    List<Product> productList = [];
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token')!;
      http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:8000/home/products/$category'),
        headers: {
          'Content-Type': "application/json;charset=UTF-8",
          'x-auth-header': token,
        },
      );
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () {
          var products = jsonDecode(response.body)['products'];
          for (var i = 0; i < products.length; i++) {
            productList.add(Product.fromMap(products[i]));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  Future<List<Product>> fetchSearchedProduct(
      {required BuildContext context, required String searchQuery}) async {
    List<Product> productList = [];
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token')!;
      http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:8000/home/products?search=$searchQuery'),
        headers: {
          'Content-Type': "application/json;charset=UTF-8",
          'x-auth-header': token,
        },
      );
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () {
          var products = jsonDecode(response.body)['products'];
          for (var i = 0; i < products.length; i++) {
            productList.add(Product.fromMap(products[i]));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
