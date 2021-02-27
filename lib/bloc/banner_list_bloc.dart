import 'package:demo_app/models/banner_response.dart';
import 'package:demo_app/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class BannerListBloc {
  final AppRepository _repository = AppRepository();

  final BehaviorSubject<BannerResponse> _bannerSubject = BehaviorSubject();

  BehaviorSubject<BannerResponse> get bannerList => _bannerSubject;

  getBanner(int limit) async {
    BannerResponse res = await _repository.getBannerSlide(limit);
    _bannerSubject.sink.add(res);
  }

  dispose() {
    _bannerSubject?.close();
  }
}

final bannerListBloc = BannerListBloc();
