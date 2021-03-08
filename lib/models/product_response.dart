import 'package:demo_app/models/product.dart';

class ProductResponse {
  final List<Product> products;
  final String error;

  ProductResponse({this.products, this.error});

  ProductResponse.fromJson(Map<String, dynamic> json)
      : products =
            (json['data'] as List).map((i) => Product.fromJson(i)).toList(),
        error = "";

  ProductResponse.fromJsonByShop(Map<String, dynamic> json)
      : products = (json['data']['_products'] as List)
            .map((i) => Product.fromJson(i))
            .toList(),
        error = "";

  ProductResponse.withError(String errorValue)
      : products = [],
        error = errorValue;
}
