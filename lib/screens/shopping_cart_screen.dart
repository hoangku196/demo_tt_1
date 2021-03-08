import 'package:demo_app/events/events.dart';
import 'package:demo_app/screens/pay_screen.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/states/states.dart';
import 'package:demo_app/bloc/bloc.dart';
import 'package:demo_app/utls/utls.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/widgets/widgets.dart';

class ShoppingCartScreen extends StatefulWidget {
  final Product product;
  static final route = '/shoppingcartscreen';

  ShoppingCartScreen({this.product});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Giỏ hàng'),
      ),
      body: StreamBuilder<ShoppingState>(
          stream: shoppingCartBloc.shoppingState.stream,
          builder: (context, AsyncSnapshot<ShoppingState> snapshot) {
            if (snapshot.data is EmptyItemState) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                    Text(
                      'Không có sản phẩm trong giỏ hàng',
                      style: boldStyle,
                    ),
                    Text(
                      'Lướt PGA, mua sắm ngay đây !',
                      style: normalBlackStyle,
                    ),
                    Container(
                      width: 150,
                      child: AppButton(
                        title: 'Mua Sắm Ngay',
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.data is HaveItemsState) {
              final HaveItemsState state = snapshot.data;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) => BuildItemCart(
                        product: state.items.keys.elementAt(index),
                        amount: state.items.values.elementAt(index),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          alignment: Alignment.centerRight,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Tổng thanh toán'),
                              Text(
                                formatPrice(state.getTotalValue()),
                                style: priceStyle,
                              ),
                            ],
                          ),
                        )),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, PayScreen.route,
                              arguments: PayScreenAgrument(items: state.items)),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: double.infinity,
                            color: Colors.red,
                            alignment: Alignment.center,
                            child: Text(
                              'Thanh toán',
                              style: normalStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}

class BuildItemCart extends StatelessWidget {
  final Product product;
  final int amount;

  BuildItemCart({this.product, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://devpga.nanoweb.vn/static${product.avatarPath}${product.avatarName}'),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: normalBlackStyle,
                  ),
                  Text(
                    formatPrice(product.price),
                    style: priceStyle,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (amount > 1)
                          shoppingCartBloc.shoppingEvent.sink
                              .add(MinusProductEvent(product: product));
                        else {}
                      },
                      child: Text('-'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('$amount'),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => shoppingCartBloc.shoppingEvent.sink
                          .add(AddProductEvent(product: product)),
                      child: Text('+'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => shoppingCartBloc.shoppingEvent.sink
                    .add(DeleteProductEvent(product: product)),
                child: Icon(
                  Icons.remove,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShoppingCartScreenAgrument {
  final Product product;
  ShoppingCartScreenAgrument({this.product});
}
