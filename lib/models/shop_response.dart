import 'shop.dart';

class ShopResponse {
  final List<Shop> shops;
  final String error;

  ShopResponse({this.shops, this.error});

  ShopResponse.fromJson(Map<String, dynamic> json)
      : shops = (json['data'] as List).map((i) => Shop.fromJson(i)).toList(),
        error = "";

  ShopResponse.withError(String errorValue)
      : shops = [],
        error = errorValue;
}
