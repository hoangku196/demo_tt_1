import 'package:demo_app/models/hot_item.dart';

class HotitemResponse {
  final List<HotItem> hotItems;
  final String error;

  HotitemResponse({this.hotItems, this.error});

  HotitemResponse.fromJson(Map<String, dynamic> json)
      : hotItems =
            (json['data'] as List).map((i) => HotItem.fromJson(i)).toList(),
        error = "";

  HotitemResponse.withError(String errorValue)
      : hotItems = [],
        error = errorValue;
}
