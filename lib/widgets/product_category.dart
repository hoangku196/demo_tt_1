import 'package:flutter/material.dart';

import 'package:demo_app/models/models.dart' as model;
import 'package:demo_app/bloc/bloc.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.21;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: height,
        child: StreamBuilder<model.ProductCatResponse>(
          stream: productBloc.productCat.stream,
          builder: (context, AsyncSnapshot<model.ProductCatResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return BuildError(error: snapshot.data.error);
              }
              return BuildProductCat(data: snapshot.data, height: height);
            } else if (snapshot.hasError) {
              return BuildError(error: snapshot.error);
            } else {
              return BuildLoding();
            }
          },
        ),
      ),
    );
  }
}

class BuildLoding extends StatelessWidget {
  const BuildLoding({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        ),
      );
}

class BuildProductCat extends StatelessWidget {
  const BuildProductCat({
    Key key,
    @required this.data,
    @required this.height,
  }) : super(key: key);

  final model.ProductCatResponse data;
  final double height;

  @override
  Widget build(BuildContext context) {
    List<model.ProductCat> productCats = data.productCats;
    return GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      children: List.generate(productCats.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.25,
              width: height * 0.25,
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
                fontSize: 12.0,
              ),
            ),
          ],
        );
      }),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
    );
  }
}

class BuildError extends StatelessWidget {
  const BuildError({
    Key key,
    @required this.error,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) => Center(
        child: Text('Error occured: $error'),
      );
}
