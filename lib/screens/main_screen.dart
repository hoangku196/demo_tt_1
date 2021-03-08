import 'package:demo_app/bloc/bloc.dart';
import 'package:demo_app/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:demo_app/widgets/widgets.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  static const String route = '/mainscreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 100,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                  child: Container(
                    height: 50,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/Group_8113.png',
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Nạp tiền',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/Group_535.png',
                                  height: 50.0,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Chuyển V',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/Group_596.png',
                                  height: 50.0,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'QR-DV',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/Group.png',
                                  height: 50.0,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Mã QR',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          ProductCategory(),
          HotItem(),
          Discount(),
          Divider(
            thickness: 5,
            color: Colors.grey[300],
          ),
          KeySearchItem(),
        ],
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

  // final PageStorageBucket _bucket = PageStorageBucket();

  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    productBloc
      ..getProducts(4)
      ..getProductCat();
    bannerListBloc..getBanner(4);
  }

  @override
  void dispose() {
    super.dispose();
    productBloc.dispose();
    bannerListBloc.dispose();
    shoppingCartBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    print('build');
    return Scaffold(
      appBar: MainAppBar(
        height: MediaQuery.of(context).size.height * 0.4,
        icons: [
          Icon(
            Icons.search,
            size: 30.0,
          ),
          Icon(
            Icons.search,
            size: 30.0,
          ),
        ],
      ),
      body: IndexedStack(
        children: pages,
        index: _currentPage,
      ),
      bottomNavigationBar: BottomNavBar(
        defaultSelectedIndex: 0,
        onChange: (val) {
          setState(() {
            _currentPage = val;
          });
        },
      ),
    );
  }
}
