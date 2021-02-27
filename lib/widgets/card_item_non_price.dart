import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                              image: NetworkImage(urlImage),
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
