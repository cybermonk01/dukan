import 'dart:convert';
import 'dart:io';
import 'package:dukan/config.dart';
import 'package:dio/dio.dart';
import 'package:dukan/models/category.dart';
import 'package:dukan/models/customer.dart';
import 'package:dukan/models/product.dart';

class APIService {
  Future<bool> createCustomer(CustomerModel model) async {
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secret),
    );

    bool ret = false;

    try {
      var response = await Dio().post(Config.url + Config.customerUrl,
          data: model.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json'
          }));

      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<List<Category>> getCategories() async {
    // ignore: deprecated_member_use
    List<Category> data = List<Category>();
    try {
      String url = Config.url +
          Config.categoriesUrl +
          "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
      var response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Category.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<List<Product>> getProduct(String tagName) async {
    // ignore: deprecated_member_use
    List<Product> data = new List<Product>();

    try {
      String url = Config.url +
          Config.productsUrl +
          '?consumer_key=${Config.key}&consumer_secret=${Config.secret}&tag=$tagName';
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Product.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }
}
