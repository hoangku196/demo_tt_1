import 'package:flutter/material.dart';

import 'package:demo_app/bloc/bloc.dart';
import 'package:demo_app/models/models.dart' as model;

import 'main_slide_show.dart';

class Slide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: StreamBuilder<model.BannerResponse>(
            stream: bannerListBloc.bannerList.stream,
            builder: (context, AsyncSnapshot<model.BannerResponse> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return _buildError(snapshot.data.error);
                }
                return _buildSlideShow(snapshot.data);
              } else if (snapshot.hasError) {
                return _buildError(snapshot.error);
              } else {
                return buildLoading();
              }
            }),
      ),
    );
  }

  Widget _buildError(String error) => Center(
        child: Text('Error occured: $error'),
      );

  Widget buildLoading() => Center(
        child: SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        ),
      );

  Widget _buildSlideShow(model.BannerResponse data) {
    List<model.Banner> banners = data.banners;
    List<Widget> widgets = [];
    for (int i = 0; i < banners.length; i++) {
      widgets.add(BuildImageSlide(urlImage: banners[i].src));
    }
    return MainSlideShow(widgets: widgets);
  }
}

class BuildImageSlide extends StatelessWidget {
  final urlImage;

  BuildImageSlide({this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
