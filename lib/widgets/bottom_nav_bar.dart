import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;

  BottomNavBar({this.defaultSelectedIndex = 0, @required this.onChange});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedItemIndex = 0;

  @override
  void initState() {
    super.initState();

    _selectedItemIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildColumn(0),
          buildColumn(1),
          buildColumn(2),
          buildColumn(3),
          buildColumn(4),
        ],
      ),
    );
  }

  Widget buildColumn(int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Column(
        children: [
          Expanded(
            child: Icon(
              Icons.home,
              color: index == _selectedItemIndex ? Colors.blue : Colors.black,
            ),
          ),
          Text(
            'Page 1',
            style: TextStyle(
              fontSize: 10,
              color: index == _selectedItemIndex ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
