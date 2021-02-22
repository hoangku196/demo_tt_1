import 'package:demo_app/project_observer.dart';
import 'package:demo_app/repositories/photo_repository.dart';
import 'package:demo_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:demo_app/search/bloc/blocs.dart';

import 'screens/screens.dart';

void main() {
  final PhotoRepository repository = PhotoRepository();
  Bloc.observer = ProjectObserver();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.route,
      routes: {
        MainScreen.route: (context) => MainScreen(),
        SearchScreen.route: (context) => BlocProvider(
            create: (context) => SearchBloc(repository: repository),
            child: SearchScreen()),
        OtherScreen.route: (context) => OtherScreen(),
      },
    ),

    // BlocProvider(
    //   create: (context) => SearchBloc(listItem: ListItem()),
    //   child: App(),
    // ),
  );
}
