import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:demo_app/models/models.dart';

class CardItemNonPrice extends StatelessWidget {
  final Product product;
  final double height;

  const CardItemNonPrice({this.product, this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: height * 0.8,
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: http.get(
                        'http://devpga.nanoweb.vn/static${product.avatarPath}${product.avatarName}'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: height * 0.6,
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
                        );
                      } else
                        return SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        );
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
