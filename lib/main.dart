import 'package:demo_app/project_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:demo_app/search/bloc/blocs.dart';
import 'package:demo_app/search/repository/list_item.dart';

import 'screens/main_screen.dart';

void main() {
  Bloc.observer = ProjectObserver();
  runApp(
    MaterialApp(
      initialRoute: MainScreen.route,
      routes: {
        MainScreen.route: (context) => BlocProvider(
              create: (context) => SearchBloc(listItem: ListItem()),
              child: MainScreen(),
            ),
      },
    ),

    // BlocProvider(
    //   create: (context) => SearchBloc(listItem: ListItem()),
    //   child: App(),
    // ),
  );
}
