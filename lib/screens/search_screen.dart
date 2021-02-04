import 'package:demo_app/models/models.dart';
import 'package:demo_app/repositories/photo_repository.dart';
import 'package:demo_app/search/bloc/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/rendering.dart';

class SearchScreen extends StatefulWidget {
  static const route = '/searchscreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();
  final _textEditController = TextEditingController();
  SearchBloc _searchBloc;

  List<Photo> photos;
  final limitList = 6;
  var indexList = 0;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _searchBloc.add(LoadMoreEvent(
        currentValue: _textEditController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          height: MediaQuery.of(context).size.height * 0.25 * 0.5,
          child: TextFormField(
            controller: _textEditController,
            autofocus: true,
            maxLines: 1,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: 'Nhập từ khóa tìm kiếm',
              suffixIcon: Icon(Icons.search),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              if (value.length == 0) {
                BlocProvider.of<SearchBloc>(context).add(ClearSearchEvent());
              } else {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchAlbumIdEvent(value: value));
              }
            },
          ),
        ),
        actions: [
          Center(
            child: Text(
              'Hủy',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is PhotoUninitializedState) {
            return Center(
              child: Text('Tìm kiếm'),
            );
          }
          if (state is PhotoFetchingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PhotoFetchedState) {
            return GridView.count(
              controller: _scrollController,
              childAspectRatio: 0.8,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: List.generate(
                state.hasReachedMax
                    ? state.photos.length
                    : state.photos.length + 1,
                (index) {
                  return index >= state.photos.length
                      ? BottomLoader()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      '${state.photos[index].url}',
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: Text(
                                        'Mỹ Phẩm',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: Text(
                                        '123.123đ',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                size: 10,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                size: 10,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                size: 10,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                size: 10,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                size: 10,
                                                color: Colors.orange,
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.shopping_cart,
                                            size: 10,
                                            color: Colors.orange,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                },
              ),
            );
          } else if (state is PhotoErrorState) {
            return Center(
              child: Text('Fail'),
            );
          }
        },
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
