import 'package:flutter/material.dart';

import 'package:demo_app/models/models.dart' as model;
import 'package:demo_app/bloc/bloc.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.21,
        child: StreamBuilder<model.ProductCatResponse>(
          stream: productBloc.productCat.stream,
          builder: (context, AsyncSnapshot<model.ProductCatResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return _buildError(snapshot.data.error);
              }
              return _buildProductCat(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildError(snapshot.error);
            } else {
              return buildLoading();
            }
          },
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

  Widget _buildProductCat(model.ProductCatResponse data) {
    List<model.ProductCat> productCats = data.productCats;
    return GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      children: List.generate(
        productCats.length,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'http://devpga.nanoweb.vn/static${productCats[index].avatarPath}${productCats[index].avatarName}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              productCats[index].name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 8.0,
              ),
            ),
          ],
        ),
      ),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
    );
  }
}
