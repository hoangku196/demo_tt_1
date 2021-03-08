import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainSlideShow extends StatefulWidget {
  final List<Widget> widgets;

  MainSlideShow({@required this.widgets});

  @override
  _MainSlideShowState createState() => _MainSlideShowState();
}

class _MainSlideShowState extends State<MainSlideShow> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: widget.widgets.length,
      itemBuilder: (context, index) {
        return widget.widgets[index];
      },
      autoplay: true,
    );
  }
}
