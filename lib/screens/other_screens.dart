import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  static const route = '/otherscreen';

  const OtherScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Other Screen'),
      ),
    );
  }
}
