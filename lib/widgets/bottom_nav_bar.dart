import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 40,
            ),
            onPressed: () {
              setState(() {
                currentPage = 0;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 40,
            ),
            onPressed: () {
              setState(() {
                currentPage = 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
