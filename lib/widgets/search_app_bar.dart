import 'package:flutter/material.dart';

import 'package:demo_app/bloc/bloc.dart';
import 'package:demo_app/events/events.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final SearchBloc searchBloc;
  final double height;
  const SearchAppBar({
    Key key,
    @required this.icons,
    this.height,
    this.searchBloc,
  }) : super(key: key);

  final List<Icon> icons;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController _textEditController = TextEditingController();

  bool showSuffixIcon = false;

  int _checkEditText = 0;

  @override
  void initState() {
    super.initState();
    _textEditController.addListener(() {
      final String searchValue = _textEditController.text;
      if (searchValue.isNotEmpty && _checkEditText != searchValue.length) {
        showSuffixIcon = true;
        _checkEditText = searchValue.length;
        setState(() {});
        addEvent(searchValue);
      }
      if (searchValue.isEmpty) {
        showSuffixIcon = false;
        _checkEditText = 0;
        setState(() {});
        widget.searchBloc.searchEvent.sink.add(ClearSearchEvent());
      }
    });
  }

  addEvent(String value) {
    widget.searchBloc.searchEvent.sink.add(SearchProductEvent(value: value));
  }

  @override
  void dispose() {
    _textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.deepPurpleAccent,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: widget.icons[0],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _textEditController,
                autofocus: true,
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
                  suffixIcon: showSuffixIcon
                      ? IconButton(
                          onPressed: () {
                            _textEditController.clear();
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 30.0,
                            color: Colors.grey,
                          ))
                      : null,
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
