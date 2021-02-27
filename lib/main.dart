import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/project_observer.dart';

import 'package:demo_app/search/bloc/blocs.dart';

import 'screens/screens.dart';

main() {
  Bloc.observer = ProjectObserver();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.route,
      routes: {
        MainScreen.route: (context) => MainScreen(),
        SearchScreen.route: (context) => BlocProvider(
            create: (context) => SearchBloc(), child: SearchScreen()),
        OtherScreen.route: (context) => OtherScreen(),
      },
    ),
  );
}
