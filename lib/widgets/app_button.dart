import 'package:demo_app/utls/utls.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;

  const AppButton({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Center(
        child: Text(
          title,
          style: normalStyle,
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
