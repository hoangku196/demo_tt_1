import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {

  final String urlImage, name, price;

  const CardItem({this.urlImage, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height:
            MediaQuery.of(context).size.height * 0.4 * 0.8 -
                8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  urlImage,
                ),
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
                    price,
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
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
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
