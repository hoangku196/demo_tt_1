import 'package:demo_app/models/banner.dart';

class BannerResponse {
  final List<Banner> banners;
  final String error;

  BannerResponse({this.banners, this.error});

  BannerResponse.fromJson(Map<String, dynamic> json)
      : banners =
            (json['data'] as List).map((i) => Banner.fromJson(i)).toList(),
        error = "";

  BannerResponse.withError(String errorValue)
      : banners = [],
        error = errorValue;
}
