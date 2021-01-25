import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:demo_app/search/bloc/blocs.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MainAppBar({this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(
        'images/user_icon.png',
      ),
      title: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, searchState) {
          return TextFormField(
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search Here',
              hintStyle: TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(

              ),
            ),
            onChanged: (value) {
              BlocProvider.of<SearchBloc>(context)
                  .add(SearchUnitToggled(value: value));
            },
          );
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shop),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
