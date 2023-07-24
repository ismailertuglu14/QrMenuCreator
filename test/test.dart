import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qrmenu/main.dart';

// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  test('Register Test', () async {
    Dio dio = Dio();

    final FormData formData = FormData.fromMap({
      "menuId": "64baedd3c514cad78c3aa10a",
      "categoryId": "64baf13c867e43598ffd6ba6",
      "name": "name",
      "description": "description",
      "price": 50,
      "currency": "TL",
      "images": [],
      "isActive": true,
      "addOns": [
        {"name": "Protein", "description": "1", "price": 10},
        {"name": "Carbs", "description": "2", "price": 20},
        {"name": "Fats", "description": "3", "price": 30},
        {"name": "Fibre", "description": "4", "price": 40}
      ],
      "allergens": [
        {"name": "Molluscs", "isAllergen": true}
      ],
      "nutritions": [
        {"name": "Protein", "value": 10},
        {"name": "Carbs", "value": 20},
        {"name": "Fats", "value": 30},
        {"name": "Fibre", "value": 40}
      ],
    });
    Response response = await dio.post(
        "https://qrmenuapi.azurewebsites.net/api/v1/product/create",
        data: formData,
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBkNjUzMzU2LWVmNGMtNDVkMC04NmU0LWYxN2NjZDlkM2E2OSIsInJvbGUiOjAsImlhdCI6MTY5MDAzODY0OCwiZXhwIjoxNjkyNjMwNjQ4fQ.sKk1A89Ug8-0qcHtdATxaTom5me6fYyPorST811QZYY'
          },
        ));

    print(response.statusCode);

    expect(response.statusCode == 200, true);
  });
}
