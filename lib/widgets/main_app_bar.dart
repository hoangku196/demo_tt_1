import 'package:demo_app/events/events.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/bloc/bloc.dart';
import 'package:demo_app/screens/screens.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final List<Icon> icons;
  final SearchBloc searchBloc;

  const MainAppBar({this.height, this.icons, this.searchBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.deepPurpleAccent,
      child: Row(
        children: [
          icons[0],
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                readOnly: true,
                onTap: () {
                  Navigator.pushNamed(context, SearchScreen.route);
                },
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  hintText: 'Tìm kiếm sản phẩm',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          icons[1],
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
