import 'package:flutter/material.dart';

import 'screens/screens.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.route,
      routes: {
        MainScreen.route: (context) => MainScreen(),
        SearchScreen.route: (context) => SearchScreen(),
        OtherScreen.route: (context) => OtherScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailsScreen.route) {
          final ProductDetailsScreenAgrument args = settings.arguments;

          return MaterialPageRoute(builder: (context) {
            return ProductDetailsScreen(
              product: args.product,
            );
          });
        } else if (settings.name == ShoppingCartScreen.route) {
          final ShoppingCartScreenAgrument args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return ShoppingCartScreen(
              product: args.product,
            );
          });
        } else if (settings.name == PayScreen.route) {
          final PayScreenAgrument args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return PayScreen(
              items: args.items,
            );
          });
        } else {
          return null;
        }
      },
    ),
  );
}
