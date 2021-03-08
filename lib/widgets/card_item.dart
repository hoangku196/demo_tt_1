import 'package:demo_app/models/models.dart';
import 'package:demo_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:demo_app/utls/utls.dart';

class CardItem extends StatelessWidget {
  final Product product;

  const CardItem({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.route,
          arguments: ProductDetailsScreenAgrument(product: product)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder(
                    future: http.get(
                        'http://devpga.nanoweb.vn/static${product.avatarPath}${product.avatarName}'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                onError: (exception, stackTrace) =>
                                    print('Lỗi không có ảnh'),
                                image: NetworkImage(
                                  'http://devpga.nanoweb.vn/static${product.avatarPath}${product.avatarName}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError)
                        return Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/user_icon.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      else
                        return SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        );
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Text(
                    formatPrice(product.price),
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 15,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.favorite,
                            size: 15,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.favorite,
                            size: 15,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.favorite,
                            size: 15,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.favorite,
                            size: 15,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.shopping_cart,
                        size: 15,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
