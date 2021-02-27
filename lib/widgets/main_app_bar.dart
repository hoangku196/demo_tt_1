import 'package:demo_app/screens/screens.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final List<Icon> icons;

  const MainAppBar({this.height, this.icons});

  @override
  Widget build(BuildContext context) {
    if (icons.length > 1)
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
    else
      return AppBarSearchScreen(icons: icons);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class AppBarSearchScreen extends StatefulWidget {
  const AppBarSearchScreen({
    Key key,
    @required this.icons,
  }) : super(key: key);

  final List<Icon> icons;

  @override
  _AppBarSearchScreenState createState() => _AppBarSearchScreenState();
}

class _AppBarSearchScreenState extends State<AppBarSearchScreen> {
  TextEditingController _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.deepPurpleAccent,
      child: Row(
        children: [
          widget.icons[0],
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _textEditController,
                autofocus: true,
                onChanged: (text) {},
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
        ],
      ),
    );
  }
}
