import 'package:flutter/material.dart';

import 'package:demo_app/models/models.dart' as model;
import 'package:demo_app/widgets/card_item.dart';
import 'package:demo_app/bloc/bloc.dart';

class Discount extends StatefulWidget {
  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height * 0.4 * 0.2 - 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Discount/Save',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Xem Thêm >',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<model.ProductResponse>(
            stream: productBloc.product.stream,
            builder: (context, AsyncSnapshot<model.ProductResponse> snapshot) {
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
        ],
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
      shrinkWrap: true,
      primary: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      children: List.generate(
        products.length,
        (index) => Container(
          child: CardItem(
            product: products[index],
          ),
        ),
      ),
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
    );
  }
}
