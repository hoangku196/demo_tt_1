import 'package:demo_app/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/models/models.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Product product;
  final double height;

  const DetailAppBar({this.product, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.deepPurpleAccent,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
          ),
          Expanded(
            child: Container(
              child: Text(
                product.name,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, ShoppingCartScreen.route,
                arguments: ShoppingCartScreenAgrument(product: product)),
            child: Icon(
              Icons.shop,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
