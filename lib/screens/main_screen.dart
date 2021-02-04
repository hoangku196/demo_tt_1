import 'package:demo_app/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:demo_app/widgets/widgets.dart';
import 'package:demo_app/repositories/repositories.dart';

class Item {
  String image, des;

  Item({this.image, this.des});
}

class Slide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: MainSlideShow(
          widgets: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.orange,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.4 * 0.2 - 20,
              child: Text(
                'Sản Phẩm Hot',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
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

class ListControlItem extends StatelessWidget {
  List<Item> items = [
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
    Item(
      image: 'images/meal.png',
      des: 'Ăn uống',
    ),
    Item(
      image: 'images/shopping-cart.png',
      des: 'Đi chợ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          children: List.generate(
            items.length,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  items[index].image,
                  height: 30,
                  width: 30,
                ),
                Text(items[index].des),
              ],
            ),
          ),
          mainAxisSpacing: 5,
          crossAxisSpacing: 10,
        ),
      ),
    );
  }
}

class Discount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
                  ),
                  CardItem(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ phẩm',
                    price: '100.000 đ',
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

class Trending extends StatelessWidget {
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardItemNonPrice(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ Phẩm',
                  ),
                  CardItemNonPrice(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ Phẩm',
                  ),
                  CardItemNonPrice(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ Phẩm',
                  ),
                  CardItemNonPrice(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ Phẩm',
                  ),
                  CardItemNonPrice(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ Phẩm',
                  ),
                  CardItemNonPrice(
                    urlImage:
                        'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                    name: 'Mỹ Phẩm',
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

class MainScreen extends StatefulWidget {
  static const String route = '/mainscreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class Page1 extends StatelessWidget {
  Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MainAppBar(),
            Slide(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Link giới thiệu',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                height: 1,
              ),
            ),
            ListControlItem(),
            HotItem(),
            Discount(),
            Divider(
              thickness: 5,
              color: Colors.grey[300],
            ),
            Trending(),
          ],
        ),
      ),
    );
  }
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = [
    Page1(
      key: PageStorageKey('Page1'),
    ),
    Page1(
      key: PageStorageKey('Page2'),
    ),
    OtherScreen(
      key: PageStorageKey('Page3'),
    ),
    OtherScreen(
      key: PageStorageKey('Page4'),
    ),
    OtherScreen(
      key: PageStorageKey('Page5'),
    ),
  ];

  final PageStorageBucket _bucket = PageStorageBucket();

  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    print('intit');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: currentPage,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPage = 0;
                });
              },
              child: buildColumn(0),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPage = 1;
                });
              },
              child: buildColumn(1),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPage = 2;
                });
              },
              child: Icon(
                Icons.home,
                size: 40,
                color: currentPage == 2 ? Colors.blue : Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPage = 3;
                });
              },
              child: buildColumn(3),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentPage = 4;
                });
              },
              child: buildColumn(4),
            ),
          ],
        ),
      ),
    );
  }

  Column buildColumn(int index) {
    return Column(
      children: [
        Expanded(
          child: Icon(
            Icons.home,
            color: index == currentPage ? Colors.blue : Colors.black,
          ),
        ),
        Text(
          'Page 1',
          style: TextStyle(
            fontSize: 10,
            color: index == currentPage ? Colors.blue : Colors.black,
          ),
        ),
      ],
    );
  }
}
