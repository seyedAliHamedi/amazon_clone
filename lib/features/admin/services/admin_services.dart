// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/core/error_handling.dart';
import 'package:amazon_clone/core/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AdminServices {
  final dio = Dio();
  void sellProducts({
    required BuildContext context,
    required String productName,
    required String productDescription,
    required double productPrice,
    required double productQty,
    required String category,
    required List<File> images,
  }) async {
    try {
      List<String> imageUrls = await uploadImages(images: images);
      Product product = Product(
        name: productName,
        description: productDescription,
        price: productPrice,
        quantity: productQty,
        category: category,
        imageUrls: imageUrls,
        id: null,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");
      http.Response response = await http.post(
        Uri.parse('http://127.0.0.1:8000/admin/add-product'),
        headers: {
          'Content-Type': "application/json; charset=UTF-8",
          'x-auth-header': token!,
        },
        body: product.toJson(),
      );
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product Added succesfully");
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<String>> uploadImages({required List<File> images}) async {
    List<String> photoUrls = [];
    List<MultipartFile> photos = [];
    for (var i = 0; i < images.length; i++) {
      photos.add(await MultipartFile.fromFile(images[i].path,
          filename: basename(images[i].path)));
    }
    final formData = FormData.fromMap({'photos': photos});

    final response = await dio.post('http://127.0.0.1:8000/admin/upload-images',
        data: formData, options: Options(headers: {}));
    for (var i = 0; i < response.data['filePaths'].length; i++) {
      photoUrls.add(response.data['filePaths'][i]);
    }

    return photoUrls;
  }
}
