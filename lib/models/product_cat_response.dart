import 'package:demo_app/models/product_cat.dart';

class ProductCatResponse {
  final List<ProductCat> productCats;
  final String error;

  ProductCatResponse({this.productCats, this.error});

  ProductCatResponse.fromJson(Map<String, dynamic> json)
      : productCats =
            (json['data'] as List).map((i) => ProductCat.fromJson(i)).toList(),
        error = "";

  ProductCatResponse.withError(String errorValue)
      : productCats = [],
        error = errorValue;
}
