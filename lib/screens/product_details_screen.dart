import 'package:demo_app/events/events.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/models/models.dart';
import 'package:demo_app/widgets/widgets.dart';
import 'package:demo_app/bloc/bloc.dart';
import 'package:demo_app/utls/utls.dart';

class ProductDetailsScreen extends StatefulWidget {
  static final String route = "/productdetailscreen";
  final Product product;

  const ProductDetailsScreen({this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> _tabs = [
    Tab(
      text: 'CHI TIẾT SẢN PHẨM',
    ),
    Tab(
      text: 'NHÀ SẢN XUẤT',
    ),
    Tab(
      text: 'VIDEO',
    ),
    Tab(
      text: 'ĐÁNH GIÁ',
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(
        height: MediaQuery.of(context).size.height * 0.4,
        product: widget.product,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://devpga.nanoweb.vn/static${widget.product.avatarPath}${widget.product.avatarName}',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: header1Style,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            _buildStar(5, Colors.grey),
                            Container(
                              width: 10,
                            ),
                            Text('|'),
                            Container(
                              width: 10,
                            ),
                            Icon(
                              Icons.remove_red_eye,
                              size: 15,
                            ),
                            Text(widget.product.viewed),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Giá: ${formatPrice(widget.product.price)}',
                          style: priceStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                    color: Colors.grey[200],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'http://devpga.nanoweb.vn/static${widget.product.avatarPath}${widget.product.avatarName}',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.product.shop.name),
                                _buildStar(5, Colors.yellow),
                              ],
                            ),
                          ],
                        ),
                        AppButton(
                          title: 'Xem Shop',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                    color: Colors.grey[200],
                  ),
                  Container(
                    color: Colors.orange[200],
                    width: double.infinity,
                    height: 50,
                    child: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(
                        color: Colors.orange[500],
                      ),
                      controller: _tabController,
                      tabs: _tabs,
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Container(
          height: 500,
          child: TabBarView(
            controller: _tabController,
            children: _tabs
                .map((Tab tab) => _getPage(tab, widget.product.shopId))
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  shoppingCartBloc.shoppingEvent
                      .add(AddProductEvent(product: widget.product));
                  final snackBar =
                      SnackBar(content: Text('Bạn đã đặt hàng thành công'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  color: Colors.orange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      Text(
                        'Thêm vào giỏ hàng',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MUA NGAY',
                      style: normalStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStar(int amount, Color color) {
    List<Widget> widgets = [];
    for (int i = 1; i <= amount; i++) {
      widgets.add(Icon(
        Icons.star_outline,
        size: 15,
        color: color,
      ));
    }
    return Row(
      children: widgets,
    );
  }

  Widget _getPage(Tab tab, String shopId) {
    switch (tab.text) {
      case 'CHI TIẾT SẢN PHẨM':
        return TabDetail(
          shopId: shopId,
        );
      case 'NHÀ SẢN XUẤT':
        return TabProducer();
      case 'VIDEO':
        return TabVideo();
      case 'ĐÁNH GIÁ':
        return TabReview();
    }
  }
}

class ProductDetailsScreenAgrument {
  final Product product;
  ProductDetailsScreenAgrument({this.product});
}

class TabDetail extends StatefulWidget {
  final String shopId;

  const TabDetail({this.shopId});

  @override
  _TabDetailState createState() => _TabDetailState();
}

class _TabDetailState extends State<TabDetail> {
  ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = ProductBloc()..getProductsByShop(widget.shopId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductResponse>(
      stream: productBloc.productByShop.stream,
      builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildError(snapshot.data.error);
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Danh mục',
                            style: boldStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Ngày đăng bán',
                            style: boldStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Trạng thái',
                            style: boldStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Giao hàng từ',
                            style: boldStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ': Cập nhật',
                            style: normalBlackStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ': Cập nhật',
                            style: normalBlackStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ': Cập nhật',
                            style: normalBlackStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ': Cập nhật',
                            style: normalBlackStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.blue,
                        Colors.green,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'SẢN PHẨM KHÁC CỦA CÔNG TY',
                          style: header2Style,
                        ),
                      ),
                      _buildHotItemCard(snapshot.data),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return _buildError(snapshot.error);
        } else {
          return buildLoading();
        }
      },
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

  Widget _buildHotItemCard(ProductResponse data) {
    List<Product> products = data.products;
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: true,
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

class TabProducer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TabVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TabReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
