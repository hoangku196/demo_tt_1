import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainSlideShow extends StatelessWidget {
  final List<Widget> widgets;

  MainSlideShow({@required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: widgets.length,
      itemBuilder: (context, index) {
        return widgets[index];
      },
      autoplay: true,
      pagination: SwiperPagination(),
    );
  }
}
