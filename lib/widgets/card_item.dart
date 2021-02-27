import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CardItem extends StatelessWidget {
  final String urlImage, name;
  final double price;

  final bool haveImage;

  const CardItem({this.urlImage, this.name, this.price, this.haveImage});

  String formatPrice(double price) {
    var formatCurrency =
        NumberFormat.simpleCurrency(locale: 'en_US', decimalDigits: 0);
    String format = formatCurrency.format(price);
    return format.substring(1, format.length) + '  đ';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder(
                    future: http.get(urlImage),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              onError: (exception, stackTrace) =>
                                  print('Lỗi không có ảnh'),
                              image: NetworkImage(
                                urlImage,
                              ),
                              fit: BoxFit.cover,
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
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Text(
                    formatPrice(price),
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
                            size: 10,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.favorite,
                            size: 10,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.favorite,
                            size: 10,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.favorite,
                            size: 10,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.favorite,
                            size: 10,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.shopping_cart,
                        size: 10,
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
