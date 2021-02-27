import 'package:demo_app/widgets/card_item.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/bloc/bloc.dart';
import 'package:demo_app/widgets/card_item_non_price.dart';
import 'package:demo_app/models/models.dart' as model;

class KeySearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Xu hướng tìm kiếm',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.33,
              child: StreamBuilder<model.ProductResponse>(
                stream: productBloc.product.stream,
                builder:
                    (context, AsyncSnapshot<model.ProductResponse> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.error != null &&
                        snapshot.data.error.length > 0) {
                      return _buildError(snapshot.data.error);
                    }
                    return _buildHotItemCard(snapshot.data);
                  } else if (snapshot.hasError) {
                    return _buildError(snapshot.error);
                  } else {
                    return buildLoading();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(String error) => Center(
        child: Text('Error occured: $error'),
      );

  Widget buildLoading() => Center(
        child: SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        ),
      );

  Widget _buildHotItemCard(model.ProductResponse data) {
    List<model.Product> products = data.products;
    return GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 1,
      childAspectRatio: 1.0,
      children: List.generate(
        products.length,
        (index) => CardItemNonPrice(
          urlImage:
              'http://devpga.nanoweb.vn/static${products[index].avatarPath}${products[index].avatarName}',
          name: products[index].alias,
        ),
      ),
      mainAxisSpacing: 5,
      crossAxisSpacing: 10,
    );
  }
}
