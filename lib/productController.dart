import 'dart:convert';

import 'package:dpit/productModel.dart';
import 'package:dpit/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductController{
  List<Data>products = [];

    Future<void>readProduct()async {
      final response = await http.get(Uri.parse(Urls.readProduct));

      print(response.body);

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        ProductModel model = ProductModel.fromJson(data);
        products = model.data ?? [];
      }
    }



  Future<void> createProduct(String name,String img,int qty,int price,int totalPrice) async {
    final response = await http.post(Uri.parse(Urls.createProduct),
        headers: {'Content-Type' : 'application/json'},
        body: jsonEncode({
          "ProductName": name,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": img,
          "Qty": qty,
          "UnitPrice": price,
          "TotalPrice": totalPrice
        })
    );

    print(response);
    if (response.statusCode == 201) {
      readProduct();
    }
  }



  Future<bool> deleteProducts(String id) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(id)));

    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }else{
      return false;
    }
  }





  Future<void> UpdateProduct(String id,String name,String img,int qty,int price,int totalPrice) async {
    final response = await http.post(Uri.parse(Urls.updateProduct(id)),
        headers: {'Content-Type' : 'application/json'},
        body: jsonEncode({
          "ProductName": name,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": img,
          "Qty": qty,
          "UnitPrice": price,
          "TotalPrice": totalPrice
        })
    );

    print(response);
    if (response.statusCode == 201) {
      readProduct();
    }
  }




}