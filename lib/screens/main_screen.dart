import 'package:demo_app/search/bloc/blocs.dart';
import 'package:demo_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:demo_app/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  static const String route = '/mainscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MainAppBar(
      //   height: 60,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, searchState) {
                return TextFormField(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Search Here',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchUnitToggled(value: value));
                  },
                );
              },
            ),
            floating: true,
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Colors.yellow,
            leading: Icon(Icons.search),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 300,
                    child: MainSlideShow(
                      widgets: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 200,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 200,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    children: List.generate(
                      items.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(items[index].image),
                          Text(items[index].des),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 100,
                        width: double.infinity,
                        child: Text(
                          'Heading 1',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: GridView.count(
                          childAspectRatio: 1.5,
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 1,
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.network(
                                            'https://cf.shopee.vn/file/2254a3d75fdc75522e3d16081cededbd_tn',
                                          ),
                                          Image.network(
                                            'https://cf.shopee.vn/file/4d2efbcb42b0bbad72fdb517800bfabc',
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Text(
                                          'fdslkjkdslfkdskdfkjlsdkslfjdjkafjkskjdjkafkj;fd;kjakjdsfkjadskjd;jkdfj213123123123kkjldskjlsjksdjksjkfkjsljk',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'đ',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                '200.000',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Đã bán 62.6k',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
