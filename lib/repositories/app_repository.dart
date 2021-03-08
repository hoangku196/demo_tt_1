import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:demo_app/models/models.dart';

class AppRepository {
  static final mainUrl = "https://devpga.nanoweb.vn/api";
  final String _appToken = "f8dd2989d3918abb75b99776574153215e164857";
  final _headers = {
    'token': 'f8dd2989d3918abb75b99776574153215e164857',
  };

  // Post
  final String _getProducts = "/app/product/get-products";
  final String _getBannerSlide = "/app/home/get-banner";
  final String _getKeySearch = "/app/home/get-key-search-product";
  final String _getDetailProduct = "/app/product/data-page-detail-product";
  final String _getProductsByShop = "/app/product/data-page-detail-shop";

  //Get
  final String _getProductCatShowHome = "/app/home/get-productcat-showhome";

  Future<BannerResponse> getBannerSlide(int limit) async {
    try {
      final response = await http.post(
        Uri.parse('$mainUrl$_getBannerSlide'),
        headers: _headers,
        body: jsonEncode({'group_id': '1'}),
      );

      return BannerResponse.fromJson(json.decode(response.body));
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return BannerResponse.withError('$error');
    }
  }

  Future<ProductResponse> getProducts([int limit]) async {
    try {
      final response = await http.post(
        '$mainUrl$_getProducts',
        headers: {
          'token': _appToken,
        },
        body: jsonEncode({
          'limit': '$limit',
        }),
      );

      return ProductResponse.fromJson(json.decode(response.body));
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return ProductResponse.withError(error);
    }
  }

  Future<ProductResponse> getDetailsProduct(String productId) async {
    try {
      final response = await http.post(
        '$mainUrl$_getDetailProduct',
        headers: {
          'token': _appToken,
        },
        body: jsonEncode({
          'product_id': '$productId',
        }),
      );

      return ProductResponse.fromJson(json.decode(response.body));
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return ProductResponse.withError(error);
    }
  }

  Future<ProductResponse> getProductsByShop(String shopId) async {
    try {
      final response = await http.post(
        '$mainUrl$_getProductsByShop',
        headers: {
          'token': _appToken,
        },
        body: json.encode({
          'shop_id': shopId,
          '_products': 1,
        }),
      );

      return ProductResponse.fromJsonByShop(json.decode(response.body));
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return ProductResponse.withError(error);
    }
  }

  Future<ProductResponse> getProductsByKeyword(String keyword) async {
    try {
      final response = await http.post(
        '$mainUrl$_getProducts',
        headers: {
          'token': _appToken,
        },
        body: jsonEncode({
          'keyword': keyword,
        }),
      );

      return ProductResponse.fromJson(json.decode(response.body));
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return ProductResponse.withError(error);
    }
  }

  Future<ProductCatResponse> getProductCatShowHome() async {
    try {
      final response = await http.get(
        '$mainUrl$_getProductCatShowHome',
        headers: {
          'token': _appToken,
        },
      );

      return ProductCatResponse.fromJson(json.decode(response.body));
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return ProductCatResponse.withError(error);
    }
  }

  Future<HotitemResponse> getKeySearch(int limit) async {
    try {
      final response = await http.post(
        '$mainUrl$_getKeySearch',
        headers: {
          'token': _appToken,
        },
        body: jsonEncode({
          'limit': '$limit',
        }),
      );
      print('response' + response.body);

      return HotitemResponse.fromJson(json.decode(response.body));
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return HotitemResponse.withError(error);
    }
  }
}
