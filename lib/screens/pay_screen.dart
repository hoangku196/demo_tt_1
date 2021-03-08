import 'package:flutter/material.dart';

import 'package:demo_app/widgets/app_button.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/utls/utls.dart';

class PayScreen extends StatelessWidget {
  static final String route = '/payscreen';

  final Map<Product, int> items;
  PayScreen({this.items});

  int getTotalValue() {
    int sum = 0;

    items.forEach((key, value) {
      sum += key.price * value;
    });

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán'),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 200,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: AppButton(
                title: 'Thêm địa chỉ giao hàng',
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hình thức thanh toán',
                      style: boldBlueStyle,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.blue,
                  ),
                  PaymentOption(),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Đơn hàng của bạn',
                      style: boldBlueStyle,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.blue,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.orange[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'CTCP PGA PARTNER',
                            style: boldWhiteStyle,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Thêm mã giảm giá của shop',
                            style: boldWhiteStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => BuildItemSpend(
                  product: items.keys.elementAt(index),
                  amount: items.values.elementAt(index),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    alignment: Alignment.centerRight,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Tổng thanh toán'),
                        Text(
                          formatPrice(getTotalValue()),
                          style: priceStyle,
                        ),
                      ],
                    ),
                  )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: double.infinity,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      'Thanh toán',
                      style: normalStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildItemSpend extends StatelessWidget {
  final Product product;
  final int amount;

  BuildItemSpend({this.product, this.amount});

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
          Text(
            'x$amount',
          ),
        ],
      ),
    );
  }
}

class PaymentOption extends StatefulWidget {
  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  Payment _payment = Payment.COD;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Thanh toán bằng tiền mặt khi nhận hàng (COD)',
            style: normalBlackStyle,
          ),
          leading: Radio(
            value: Payment.COD,
            groupValue: _payment,
            onChanged: (value) {
              setState(() {
                _payment = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Thanh toán bằng PGA Voucher',
            style: normalBlackStyle,
          ),
          leading: Radio(
            value: Payment.VOUCHER,
            groupValue: _payment,
            onChanged: (value) {
              setState(() {
                _payment = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class PayScreenAgrument {
  final Map<Product, int> items;
  PayScreenAgrument({this.items});
}

enum Payment {
  COD,
  VOUCHER,
}
