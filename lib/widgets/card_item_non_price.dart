import 'package:flutter/material.dart';

class CardItemNonPrice extends StatelessWidget {
  final String urlImage, name;

  const CardItemNonPrice({this.urlImage, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
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
                    vertical: 10,
                  ),
                  child: Text(
                    name,
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
